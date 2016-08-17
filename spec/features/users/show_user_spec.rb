require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @person = create_user
    log_in @person
  end
  it 'displays information about the user' do
    expect(page).to have_text("#{@person.name}")
    expect(page).to have_link('Edit Profile')
  end
end