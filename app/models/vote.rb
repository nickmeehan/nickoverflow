class Vote < ActiveRecord::Base
	attr_accessible :upvoted, :downvoted, :votable_type, :votable_id
	
	belongs_to :user
	belongs_to :votable, polymorphic: true
end