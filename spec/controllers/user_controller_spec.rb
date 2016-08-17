require 'rails_helper'

RSpec.describe UserController, type: :controller do
  before do
    @user = create_user
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access show" do
      get :index, id: @user
      expect(response).to redirect_to('/user/register')
    end
    it "cannot access edit" do
      get :edit, id: @user
      expect(response).to redirect_to('/user/register')
    end
    it "cannot access update" do
      patch :patch, id: @user
      expect(response).to redirect_to('/user/register')
    end
    it "cannot access destroy" do
      delete :destroySession, id: @user
      expect(response).to redirect_to('/user/register')
    end
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #register" do
    it "returns http success" do
      get :register
      expect(response).to have_http_status(:success)
    end
  end

end
