require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:index)
end

post ('/') do
  @word = params[:word]
  definition_input = params[:definition]
  @word = Word.new({:word => @word})
  @word.save()
  @definition = Definition.new(:definition => definition_input, :word_id => @word.id)
  @definition.save()
  redirect('/')
end

get ('/words/new') do
  erb(:new_word)
end

get ('/words/:id') do
  @words = Word.all
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

post ('/words/:id') do
  @words = Word.all
  @word = Word.find(params[:id].to_i)
  definition_input = params[:definition]
  @definition = Definition.new(:definition => definition_input, :word_id => @word.id)
  @definition.save()
  binding.pry
  erb (:word)
end

post ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:update_word)
end

patch ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  @word.update(:word => params[:word])
  @words = Word.all
  erb(:word_updated)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:index)
end

# patch('/words/:id/definitions/:definition_id') do
#   @word = Word.find(params[:id].to_i())
#   definition = Definition.find(params[:definition_id].to_i())
#   definition.update(params[:name], @word.id)
#   erb(:Word)
# end
#
# delete('/words/:id/definitions/:definition_id') do
#   definition = Definition.find(params[:definition_id].to_i())
#   definition.delete
#   @word = Word.find(params[:id].to_i())
#   erb(:Word)
# end
