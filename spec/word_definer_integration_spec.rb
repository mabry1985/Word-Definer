require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


before(:each) do
  Word.clear()
end

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the home page') do
    visit('/')
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
    visit("/")
    click_on('Add a new word!')
    fill_in('word', :with => 'Artist')
    click_on('Add word')
    click_on('Artist')
    fill_in('definition', :with => 'someone who creates art')
    click_on("Add definition")
    expect(page).to have_content('someone who creates art')
    Word.clear
  end
end
