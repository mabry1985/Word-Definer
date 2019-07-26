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
  new_word.definition.push(definition)
  binding.pry
  redirect('/')
end

get ('/words/new') do
  erb(:new_word)
end

# post ('/new_board') do
#   title = params[:title]
#   board = Board.new({:title => title})
#   board.save()
#   redirect to ('/')
# end
#
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
