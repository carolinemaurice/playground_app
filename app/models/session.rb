class Session < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :players,
           through: :bookings,
           class_name: "User",
           foreign_key: "user_id"

  belongs_to :playground
  has_many :bookings
  has_one :chatroom

  validates :date, :duration, :minimum_players, presence: true
end
