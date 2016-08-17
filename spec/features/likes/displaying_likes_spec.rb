require 'rails_helper'
RSpec.describe 'displaying likes' do
  before do
    @person = create_user
    log_in @person
    @secret = @person.secret2s.create(content: 'Oops')
    Like2.create(person: @person, secret2: @secret)
  end
  it 'displays amount of likes next to each secret' do
    visit '/secrets'
    expect(page).to have_text(@secret.content)
    expect(page).to have_text('1 likes')
    visit "/user/#{@person.id}"
    expect(page).to have_text(@secret.content)
    expect(page).to have_text('1 likes')
  end
end