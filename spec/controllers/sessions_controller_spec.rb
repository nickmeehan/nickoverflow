require 'spec_helper'

describe SessionsController do
  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create(:user) }
    it "sets session id to user id" do
      params = { email: user.email, password: user.password }
      post :create, params
      expect(session[:user_id]).to eq user.id
      expect(response).to be_redirect
    end

    it "does not let user sign in if credentials are incorrect" do
      params = { email: "myemail", password: "mypassword" }
      post :create, params
      expect(response).to_not be_redirect
    end
  end

  context "#destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      session[:user_id] = user.id
    end
    it "logs the user the out" do
      delete :destroy, id: user.id
      expect(session[:user_id]).to eq nil
      expect(response).to be_redirect
    end
  end
end