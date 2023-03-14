class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :session

  scope :historic, -> { joins(:session).where('sessions.date < ?', Date.today) }
  scope :incoming, -> { joins(:session).where('sessions.date >= ?', Date.today) }
end
