class Vote < ActiveRecord::Base
	attr_accessible :upvoted, :downvoted, :votable_type, :votable_id
	
	belongs_to :user
	belongs_to :votable, polymorphic: true

	def self.verify_as_new(vote_params)
		if vote_params["votable_type"] == "Answer"
			answer = Answer.find(vote_params["votable_id"])
		end
	end

end