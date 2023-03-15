class Notification < ApplicationRecord
  STATUS = ['Unread', 'Read']

  belongs_to :notifications_user
  belongs_to :session

  validates :content, presence: true
end
