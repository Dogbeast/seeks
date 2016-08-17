require 'rails_helper'
RSpec.describe UserController, type: :controller do
  before do
    visit '/user/register'
  end
  it "when not logged in" do
	visit '/secrets'
	expect(current_path).to eq('/user/register')
  end
  it "when signed in as the wrong user" do
    @person = create_user
    # log_in @person
    visit '/user/1'
    expect(current_path).to eq('/user/register')
  end
end