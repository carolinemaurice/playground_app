class CreateNotificationsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications_users do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
