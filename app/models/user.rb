class User < ActiveRecord::Base
  attr_accessible :email, :username, :password
  has_secure_password
  has_many :questions
  # validates_presence_of :email, :username, :password
end