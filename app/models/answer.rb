class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :answerable, :polymorphic => true

  has_many :comments, as: :commentable
end