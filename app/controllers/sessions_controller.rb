class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    p "WEEEEEE MADDEEEE ITTT INNNNNNNNNN"
    session.clear
    redirect_to root_path
  end
end