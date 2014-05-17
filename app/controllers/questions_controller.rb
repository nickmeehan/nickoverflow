class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
    @author_id = @question.user.id
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
    Question.find(params[:id]).destroy
    redirect_to root_path
  end
end