class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX}
  # validates :name, presence: true, length: {minimum: 3, maximum: 25}
  # validates :username, presence: true,length:{minimum: 3, maximum: 25}
end
