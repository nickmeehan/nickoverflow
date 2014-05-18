class Question < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers, as: :answerable
  validates_presence_of :title, :body
end