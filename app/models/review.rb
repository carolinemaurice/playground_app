class Review < ApplicationRecord
  belongs_to :user
  belongs_to :playground

  validates :comment, presence: true
end
