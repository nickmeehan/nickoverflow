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
			answer = Answer.find(@vote.votable_id)
			render json: { answer: answer }
		else
			update
		end
	end

	def edit
	end

	def update
		@vote = Vote.find_vote(params[:vote], session[:user_id])
		if @vote.update_attributes(params[:vote])
			answer = Answer.find(@vote.votable_id)
			render json: { answer: answer }
		else
			p "WHAAATTTTT UPPP!!!"
			p params
			p @vote
		end
	end

	def destroy
	end

end