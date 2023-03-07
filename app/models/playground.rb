class Playground < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :pictures

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
