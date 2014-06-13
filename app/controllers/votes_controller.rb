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
			voted_on = Vote.determine_newly_voted_object(@vote)
			p voted_on
			render json: { voted_on: voted_on, type: @vote.votable_type.downcase }
		else
			update
		end
	end

	def edit
	end

	def update
		@vote = Vote.find_vote(params[:vote], session[:user_id])
		if @vote.update_attributes(params[:vote])
			voted_on = Vote.determine_updated_vote_object(@vote)
			render json: { voted_on: voted_on, type: @vote.votable_type.downcase }
		else
			errors = @vote.errors.full_message
			render json: { errors: errors }
		end
	end

	def destroy
	end

end