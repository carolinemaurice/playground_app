class Notification < ApplicationRecord
  belongs_to :notifications_user
  belongs_to :session

  validates :content, presence: true
end
