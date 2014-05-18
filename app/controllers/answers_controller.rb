class AnswersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @answer = Answer.new
    render :partial => 'new', :locals => { answer: @answer }
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end