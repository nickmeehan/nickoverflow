module Tallyable
	extend ActiveSupport::Concern

	def upvotes
		votes.where(upvoted: true)
	end

	def downvotes
		votes.where(downvoted: true)
	end

	def vote_counts
		upvotes.count - downvotes.count
	end

end