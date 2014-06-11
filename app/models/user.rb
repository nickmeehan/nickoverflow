class User < ActiveRecord::Base
  attr_accessible :email, :username, :password

  validates_presence_of :email, :username, :password

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
end