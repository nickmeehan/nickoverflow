class VotesController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create
		@vote = Vote.new(params[:vote])
		if @vote.save
			render json: { voted_on_id: @vote.votable_id, vote_count: @vote.votable.vote_counts }
		else
			update
		end
	end

	def edit
	end

	def update
		@vote = Vote.find_vote(params[:vote], session[:user_id])
		if @vote.update_attributes(params[:vote])
			render json: { voted_on_id: @vote.votable_id, vote_count: @vote.votable.vote_counts }
		else
			render json: { errors: @vote.errors.full_message }
		end
	end

	def destroy
	end

end