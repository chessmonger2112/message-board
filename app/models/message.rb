class Message < ActiveRecord::Base
  def self.like message_id, liker_id
    message = Message.find(message_id)
    liker = User.find(liker_id)
    message.likes.create(user: liker)
  end

  def self.delete_message message_id
    message = Message.find(message_id)
    message.delete
  end

  def self.edit id, new_content
    message = Message.find(id)
    message.update_attribute(:content, new_content)
    message.update_attribute(:edited, true)
  end
  belongs_to :user
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user
end
