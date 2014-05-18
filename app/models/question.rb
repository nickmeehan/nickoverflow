class Question < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :user
  has_many :comments, as: :respondable
  has_many :answers, as: :respondable
  validates_presence_of :title, :body
end