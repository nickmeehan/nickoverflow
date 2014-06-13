class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.belongs_to :user
  		t.references :votable, polymorphic: true
  		t.boolean :upvoted, default: false
  		t.boolean :downvoted, default: false

  		t.timestamps
  	end
  end
end
