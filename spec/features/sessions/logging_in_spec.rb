require 'rails_helper'
RSpec.describe 'logging in' do
  before do
    @person = create_user
  end
  it 'prompts for email and password' do
    visit '/user/login'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
  it 'logs in user if email/password combination is valid' do
    log_in @person
    expect(current_path).to eq("/user/#{@person.id}")
    expect(page).to have_text(@person.name)
  end
  it 'does not sign in user if email/password combination is invalid' do
    log_in @person, 'wrong password'
    expect(page).to have_text('Invalid')
  end
end