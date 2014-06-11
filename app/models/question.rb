class Question < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :title, :body
  
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end