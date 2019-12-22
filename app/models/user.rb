class User < ApplicationRecord
  has_many :posts
  has_secure_password


  validates :name, presence: true
  validates :email, presence:true
  #validates :email, presence:true, format: { with: VALID_EMAIL_REGEX },
  #         uniqueness: { case_sensitive: false }

  validates :password, presence: true
  validates :password, length: { minimum: 6 }

  validates :password_confirmation, presence: true

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end
