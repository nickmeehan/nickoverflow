class AddVoteCountToAnswers < ActiveRecord::Migration
  def up
  	add_column :answers, :vote_count, :integer, default: 0
  end

  def down
  	remove_column :answers, :vote_count
  end
end
