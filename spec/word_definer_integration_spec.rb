require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


before(:each) do
  Word.clear()
end

describe('create and edit word', {:type => :feature}) do
  it('creates a word') do
    visit('/')
    click_on('Add a new word!')
    fill_in('word', :with => 'Submarine')
    click_on('Add word')
    expect(page).to have_content('Submarine')
  end
end

describe('create and edit definition', {:type => :feature}) do
  it('creates a word and definition') do
    @word = Word.new(:word => 'Ranch')
    visit("/words/1")
    fill_in('definition', :with => 'seasoned mayo')
    click_on('Add definition')
    expect(page).to have_content('seasoned mayo')
  end
end
