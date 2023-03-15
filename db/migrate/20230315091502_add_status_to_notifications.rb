class AddStatusToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :status, :string, default: 'Unread'
  end
end
