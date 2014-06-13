class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :vote_count
  
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  include Tallyable

end