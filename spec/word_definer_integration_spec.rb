require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the home page') do
    visit('/')
    # save_and_open_page
    click_on('Add a new word!')
    fill_in('word', :with => 'Submarine')
    click_on('Add word')
    expect(page).to have_content('Submarine')
  end
end
#
# describe('create a song path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     album = Album.new("Yellow Submarine", nil, "The Beetles", "Rock")
#     album.save
#     visit("/albums/#{album.id}")
#     fill_in('song_name', :with => 'All You Need Is Love')
#     click_on('Add song')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
