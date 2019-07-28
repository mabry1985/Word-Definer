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

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:Word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:Word)
end
