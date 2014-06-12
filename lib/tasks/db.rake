namespace :db do
  desc "TODO"
  task :update_answer_vote_count => :environment do
  	answers = Answer.all

  	answers.each do |answer|
  		down_votes = answer.votes.where(downvoted: true).count
  		up_votes = answer.votes.where(upvoted: true).count
  		answer.vote_count = up_votes - down_votes
  		answer.save
  	end
  end

end
