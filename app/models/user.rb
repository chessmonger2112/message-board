class User < ActiveRecord::Base
  has_many :messages
  has_many :likes
  has_many :liked_messages, :through => :likes, :source => :message
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\w+@\w+\.\w+/
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
