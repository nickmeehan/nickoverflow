class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(session[:user_id])
    @questions = @user.questions.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end