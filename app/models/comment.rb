class Comment < ActiveRecord::Base
  attr_accessible :content, :commentable_type, :commentable_id
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  validates_presence_of :content

end
