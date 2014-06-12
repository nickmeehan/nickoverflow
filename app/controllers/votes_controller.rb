class VotesController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create
		new_vote = Vote.verify_as_new(params[:vote], session[:user_id])
		user = User.find(session[:user_id])
		@vote = user.votes.build(params[:vote])
		if new_vote && @vote.save
			p new_vote
			p params
			p @vote
			render json: { voted: "what" }
		else
			update
		end
	end

	def edit
	end

	def update
		@vote = Vote.find_vote(params[:vote], session[:user_id])
		if @vote.update_attributes(params[:vote])
			p @vote
		else
			p "WHAAATTTTT UPPP!!!"
			p params
			p @vote
		end
	end

	def destroy
	end

end