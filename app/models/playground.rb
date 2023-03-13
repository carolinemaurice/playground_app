class Playground < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :pictures

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, :description, presence: true

  scope :upcoming_sessions, ->(date) { joins(:sessions).where("sessions.date BETWEEN ? AND ?", Date.parse(date).beginning_of_day, Date.parse(date).end_of_day) }

  include PgSearch::Model
  pg_search_scope :search_by_date,
                  against: [:address],
                  associated_against: {
                    sessions: [:date]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def sessions_from(date)
    sessions.where("date BETWEEN ? AND ?", Date.parse(date).beginning_of_day, Date.parse(date).end_of_day)
  end
end
