require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:index)
end

post ('/') do
  word = params[:word]
  definition = params[:definition]
  new_word = Word.new({:word => word})
  new_word.save()
  new_word.definitions.push(definition)
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
  @word.definitions.push(params[:definition])
  erb (:word)
end

delete ('/words/:id') do
  binding.pry
  @word.definitions.delete_at(id)
  erb (:word)
end
