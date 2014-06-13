class Vote < ActiveRecord::Base
	attr_accessible :upvoted, :downvoted, :votable_type, :votable_id, :user_id
	
	belongs_to :user
	belongs_to :votable, polymorphic: true
	validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

	def self.find_vote(vote_params, voter_id)
		if vote_params["votable_type"] == "Answer"
			answer = Answer.find(vote_params["votable_id"])
			vote = answer.votes.find_by_user_id(voter_id)
			return vote
		end
	end

end