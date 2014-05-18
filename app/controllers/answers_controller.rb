class AnswersController < ApplicationController

  def index
  end

  def show
  end

  def new
    p params
    @answer = Answer.new
    render :partial => 'new', :locals => { answer: @answer }
  end

  def create
    response = Answer.save_answer(params, session[:user_id])
    if response == true
      answer = Answer.last
      :partial => 'shared/answer', :locals => { answer: answer }
    else
      render :text => response, :status => 422
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end