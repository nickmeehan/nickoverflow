class VotesController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create

		user = User.find(session[:user_id])
		@vote = user.votes.build(params[:vote])
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