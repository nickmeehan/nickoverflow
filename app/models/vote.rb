class Vote < ActiveRecord::Base
	attr_accessible :upvoted, :downvoted, :votable_type, :votable_id, :user_id
	
	belongs_to :user
	belongs_to :votable, polymorphic: true
	validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

	def self.find_vote(vote_params)
		return self.find_by_votable_type_and_votable_id_and_user_id(vote_params["votable_type"], vote_params["votable_id"], vote_params["user_id"])
	end

end