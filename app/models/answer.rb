class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id
  belongs_to :user
  belongs_to :question
  validates :content, presence: true

  has_many :comments, as: :commentable

end