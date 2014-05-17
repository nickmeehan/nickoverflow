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

end