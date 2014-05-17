require 'spec_helper'

describe UsersController do

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "assigns a new user to the page" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  context "#create" do
    it "is successful and creates a new user" do
      params = { user: FactoryGirl.attributes_for(:user) }
      expect {
        post :create, params
      }.to change { User.count }.by(1)
      expect(response).to be_redirect
    end

    it "does not create a new user and resends form" do
      expect {
        post :create
      }.not_to change { User.count }
      expect(response).not_to be_redirect
    end
  end
end