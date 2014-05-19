class CommentsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    @comment = user.comments.build(params[:comment])
    if @comment.save
      render :partial => 'shared/comment_snippet', :locals => { comment: @comment }
    else
      @errors = @comment.errors.full_messages.join(", ")
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