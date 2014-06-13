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
    user = User.find(session[:user_id])
    @answer = user.answers.build(params[:answer])
    if @answer.save
      @comment = Comment.new
      @vote = Vote.new
      render :partial => 'shared/answer', :locals => { answer: @answer, comment: @comment }
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