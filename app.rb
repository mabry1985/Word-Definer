require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
    @word = Word.find(params[:id].to_i())
  erb(:index)
end

post ('/word') do
  @word = Word.new(:word => params[:word])
  @word.save()
  @definition = Definition.new(:definition => params[:definition], :word_id => @word.id)
  @definition.save()
  erb (:word)
end

get ('/words/new') do
  @word = Word.find(params[:id].to_i())
  erb(:new_word)
end

get ('/words/:id') do
  @words = Word.all()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post '/words/:id' do
  @words = Word.all()
  @word = Word.find(params[:id].to_i())
  @definition = Definition.new(:definition => params[:definition], :word_id => @word.id)
  @definition.save()
  erb(:word)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  @words = Word.all()
  erb(:update_word)
end

# can't get patch to work
post ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  @word.update(:word => params[:word])
  @words = Word.all()
  # can't get redirect to work, won't grab word.id
  # redirect to('words/:id')
  erb(:word)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all()
  redirect to('/')
  erb(:index)
end

get('/words/:id/definitions/:definition_id') do
  @words = Word.all()
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:update_definition)
end

# can't get patch to work
post('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.update(:definition =>params[:definition])
  erb(:Word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  @words = Word.all()
  # can't get redirect to work, won't grab word.id
  # redirect to ('/words/:id')
  erb(:Word)
end
