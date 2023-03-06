class Chatroom < ApplicationRecord
  belongs_to :session
  has_many :messages

  def users
    users = session.players
    users << session.creator
  end
end
