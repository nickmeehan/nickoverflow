class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
    @author_id = @question.user.id
    @answer = Answer.new
    p @question
    p @question.answers
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    user = User.find(session[:user_id])
    @question = user.questions.build(params[:question])
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @author_id = @question.user.id
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.destroy_all
    @question.destroy
    redirect_to root_path
  end
end