class User < ActiveRecord::Base
  has_many :messages
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\w+@\w+\.\w+/
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
