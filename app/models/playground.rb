class Playground < ApplicationRecord
  has_many :sessions
  has_many :reviews

  validates :name, :address, :description, presence: true
end
