require 'spec_helper'

describe QuestionsController do

  context "#show" do
    let(:question) { FactoryGirl.create :question }
    let(:author) { question.user }
    let(:answers) { question.answers }

    before(:each) do
      params = { id: question.id }
      get :show, params
    end
    
    it "is successful" do
      expect(response).to be_success
    end

    it "assigns question to the correct Question" do
      expect(assigns(:question)).to eq question
    end

    it "assigns correct id to author" do
      expect(assigns(:author_id)).to eq author.id
    end

    it "assigns answer to be a new Answer" do
      expect(assigns(:answer)).to be_a_new Answer
    end

    it "assigns comment to be a new Comment" do
      expect(assigns(:comment)).to be_a_new Comment
    end

    it "assigns answers to the correct question" do
      expect(assigns(:answers)).to eq answers
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "assigns question to a new Question" do
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

    before(:each) do
      params = { id: question.id }
      get :edit, params
    end

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns question to the correct question" do
      expect(assigns(:question)).to eq question
    end

    it "assigns author id to the correct id" do
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

    it "destroys all associated answers of the question" do
      params = { id: question.id }
      delete :destroy, params
      expect(question.answers.count).to eq 0
    end
  end

end