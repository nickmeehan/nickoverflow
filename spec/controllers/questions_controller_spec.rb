require 'spec_helper'

describe QuestionsController do

  context "#show" do
    let(:question) { FactoryGirl.create :question }
    let(:author) { question.user }
    it "is successful" do
      params = { id: question.id }
      get :show, params
      expect(response).to be_success
    end

    it "assigns question to the correct Question" do
      params = { id: question.id }
      get :show, params
      expect(assigns(:question)).to eq question
    end

    it "assigns correct id to author" do
      params = { id: question.id }
      get :show, params
      expect(assigns(:author_id)).to eq author.id
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "assigns questions to a new Question" do
      get :new
      expect(assigns(:question)).to be_a_new Question
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user }
    before(:each) do
      session[:user_id] = user.id
    end

    it "creates a new question with valid attributes" do
      params = { question: FactoryGirl.attributes_for(:question) }
      expect {
        post :create, params
      }.to change { Question.count }.to eq(1)
      expect(response).to be_redirect
    end

    it "does not create a question with blank fields" do
      expect {
        post :create
      }.not_to change { Question.count }
      expect(response).not_to be_redirect
    end
  end

  context "#edit" do
    let(:question) { FactoryGirl.create :question }
    let(:author) { question.user }
    it "is successful" do
      params = { id: question.id }
      get :edit, params
      expect(response).to be_success
    end

    it "assigns question to the correct question" do
      params = { id: question.id }
      get :edit, params
      expect(assigns(:question)).to eq question
    end

    it "assigns author id to the correct id" do
      params = { id: question.id }
      get :edit, params
      expect(assigns(:author_id)).to eq author.id
    end
  end

  context "#update" do
    let(:question) { FactoryGirl.create :question }
    it "updates attributes correctly and redirects" do
      params = { id: question.id, question: { title: "YES" } }
      expect {
        put :update, params
      }.to change { question.reload.title }.to "YES"
      expect(response).to be_redirect
    end

    it "does not update attributes if fields are blank" do
      params = { id: question.id, question: { title: nil } }
      expect {
        put :update, params
      }.to_not change { question.reload.title }
      expect(response).to_not be_redirect
    end
  end

  context "#destroy" do
    let!(:question) { FactoryGirl.create :question }
    it "destroys the question" do
      params = { id: question.id }
      expect {
        delete :destroy, params
      }.to change { Question.count }.by(-1)
    end
  end

end