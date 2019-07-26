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

describe('create a word path and view definition', {:type => :feature}) do
  it('creates an word and definition and then goes to the word page') do
    visit("/")
    click_on('Add a new word!')
    fill_in('word', :with => 'Ranch')
    fill_in('definition', :with => 'seasoned mayo')
    click_on('Add word')
    click_on('Ranch')
    expect(page).to have_content('seasoned mayo')
  end
end

describe('add new definition', {:type => :feature}) do
  it('adds a new definition') do
    word = Word.new({:word => 'Artist'})
    word.save()
    visit("/words/1")
    fill_in('definition', :with => 'someone who creates art')
    click_on("Add definition")
    expect(page).to have_content('someone who creates art')
  end
end
