require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
  end
  it "displays a user's secrets on profile page" do
    secret = @user.secret2s.create(content: 'secret')
    visit "/user/edit/#{@user.id}"
    expect(page).to have_text("#{secret.content}")
  end
  it "displays everyone's secrets" do
    user2 = create_user 'julius', 'julius@lakers.com'
    secret1 = @user.secret2s.create(content: 'secret')
    secret2 = user2.secret2s.create(content: 'secret')
    visit '/secrets'
    expect(page).to have_text(secret1.content)
    expect(page).to have_text(secret2.content)
  end
end