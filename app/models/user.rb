class User < ActiveRecord::Base
  attr_accessible :email, :username, :password

  has_secure_password

  has_many :questions
  has_many :comments, as: :commentable
  has_many :answers

  validates_presence_of :email, :username, :password
end