require 'spec_helper'

describe QuestionsController do

  context "#show" do
    let(:question) { FactoryGirl.create :question }
    it "is successful" do
      params = { id: question.id }
      get :show, params
      expect(response).to be_success
    end
  end



end