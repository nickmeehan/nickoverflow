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
      render :json => { :template => render_to_string(:partial => 'shared/comment_snippet', :locals => { comment: @comment }), target_id: @comment.commentable_id }
    else
      @errors = @comment.errors.full_messages.join(", ")
      render :json => { errors: @errors, target_id: @comment.commentable_id }, :status => 422
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :json => { id: @comment.id, message: "No one will see your comment again!" }
    else
      @errors = @comment.errors.full_messages.join(", ")
      render :text => @errors, :status => 422
    end
  end

end