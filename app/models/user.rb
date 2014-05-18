class User < ActiveRecord::Base
  attr_accessible :email, :username, :password

  has_secure_password

  has_many :questions
  has_many :comments, as: :respondable
  has_many :answers, as: :respondable

  validates_presence_of :email, :username, :password
end