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
    @answer = User.find(session[:user_id]).answers.build(params[:answer])
    if @answer.save
      # redirect_to question_path(@answer.question)
      render :partial => 'shared/answer', :locals => { answer: @answer }
    else
      @errors = @answer.errors.full_messages.join(", ")
      render :text => @errors, :status => 422
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end