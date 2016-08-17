require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit 'user/register'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'name', with: 'kobe'
    fill_in 'email', with: 'kobe@lakers.com'
    fill_in 'password', with:  'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Register'
    last_person = Person.last
    expect(current_path).to eq("/user/#{last_person.id}")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Register'
    expect(current_path).to eq('/user/create')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end