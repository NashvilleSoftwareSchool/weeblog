class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  attr_accessible :email, :password, :password_confirmation
end
