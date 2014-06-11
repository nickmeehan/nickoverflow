class Comment < ActiveRecord::Base
  attr_accessible :content, :commentable_type, :commentable_id
  
  validates_presence_of :content
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end
