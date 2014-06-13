class Vote < ActiveRecord::Base
	attr_accessible :upvoted, :downvoted, :votable_type, :votable_id
	
	belongs_to :user
	belongs_to :votable, polymorphic: true

	after_save do
		if self.votable_type == "Answer"
			answer = Answer.find(self.votable_id)
			if self.upvoted
				answer.vote_count += 1
				answer.save
			else
				answer.vote_count -= 1
				answer.save
			end	
		end
	end

	def self.verify_as_new(vote_params, voter_id)
		if vote_params["votable_type"] == "Answer"
			answer = Answer.find(vote_params["votable_id"])
			existing_user = answer.votes.find_by_user_id(voter_id)
			existing_user == nil ? true : false
		end
	end

	def self.find_vote(vote_params, voter_id)
		if vote_params["votable_type"] == "Answer"
			answer = Answer.find(vote_params["votable_id"])
			vote = answer.votes.find_by_user_id(voter_id)
			return vote
		end
	end

	def self.determine_newly_voted_object(vote)
		if vote.votable_type == "Answer"
			return Answer.find(vote.votable_id)
		end
	end

	def self.determine_updated_vote_object(vote)
		if vote.votable_type == "Answer"
			answer = Answer.find(vote.votable_id)
			downvotes = answer.votes.where(downvoted: true).count
			upvotes = answer.votes.where(upvoted: true).count
			answer.vote_count = upvotes - downvotes
			answer.save
			return answer
		end
	end

end