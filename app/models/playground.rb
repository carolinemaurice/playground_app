class Playground < ApplicationRecord
  has_many :sessions
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :address, :description, presence: true

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
