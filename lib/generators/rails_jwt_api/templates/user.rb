class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: true
  # validates :name, presence: true, length: {minimum: 3, maximum: 25}
  # validates :username, presence: true,length:{minimum: 3, maximum: 25}

  def details
    as_json(only: [:id, :email,:created_at])
  end
end
