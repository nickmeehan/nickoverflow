class VotesController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create
		new_vote = Vote.verify_as_new(params[:vote])
		user = User.find(session[:user_id])
		@vote = user.votes.build(params[:vote])
		p new_vote
		p params
		p @vote
	end

	def edit
	end

	def update
	end

	def destroy
	end

end