class Session < ApplicationRecord
  @@GAME_TYPE = ['3v3', '5v5', '1v1 Tournament', '4v4', 'Shooting Session']
  STATUS = ['Starting soon', 'Running']
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :players,
           through: :bookings,
           class_name: "User",
           source: :user

  belongs_to :playground
  has_one :chatroom, dependent: :destroy

  validates :date, :duration, :minimum_players, presence: true
  validates :game_type, inclusion: { in: @@GAME_TYPE }
  # validates :status, inclusion: { in: STATUS }


  scope :historic, -> { where('date < ?', Date.today) }
  scope :incoming, -> { where('date >= ?', Date.today) }
end
