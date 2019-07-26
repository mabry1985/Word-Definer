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

# get ('/boards/:id') do
#   @messages = Message.all
#   @board = Board.find(params[:id].to_i)
#   @messages = Message.find_by_board(:id)
#   erb(:board)
# end
#
# post ('/newest/:id') do
#   @messages = Message.sort_time
#   @board = Board.find(params[:id].to_i)
#   # @messages = Message.find_by_board(:id)
#   erb(:board)
# end
#
# post ('/oldest/:id') do
#   @messages = Message.unsort_time
#   @board = Board.find(params[:id].to_i)
#   # @messages = Message.find_by_board(:id)
#   erb(:board)
# end
# post ('/boards/:id') do
#   header = params[:message_header]
#   body = params[:body]
#   @board = Board.find(params[:id].to_i)
#   @message = Message.new ({:header => header, :body => body, :board_id => @board.id})
#   @message.save()
#   erb (:board)
# end
