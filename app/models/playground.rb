class Playground < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :pictures

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, :description, :latitude, :longitude, presence: true

  scope :upcoming_sessions, -> { joins(:sessions).where("sessions.date > ?", Datetime.now) }

  include PgSearch::Model
  pg_search_scope :search_by_address_and_date,
                  against: [:address],
                  associated_against: {
                    sessions: [:date]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
