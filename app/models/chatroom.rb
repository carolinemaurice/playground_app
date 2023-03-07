class Chatroom < ApplicationRecord
  belongs_to :session
  has_many :messages, dependent: :destroy

  def users
    users = session.players
    users << session.creator
  end
end
