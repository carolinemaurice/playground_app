class Session < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :players,
           through: :bookings,
           class_name: "User",
           foreign_key: "user_id"

  belongs_to :playground
  has_many :bookings, dependent: :destroy
  has_one :chatroom, dependent: :destroy


  validates :date, :duration, :minimum_players, presence: true
  validates :game_type, inclusion: { in: ['3v3', '5v5', '1v1 Tournament', '4v4', 'Shooting Session'] }
end
