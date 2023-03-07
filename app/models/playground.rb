class Playground < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :pictures

  validates :name, :address, :description, presence: true
end
