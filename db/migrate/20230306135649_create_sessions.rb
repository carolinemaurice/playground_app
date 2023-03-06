class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.datetime :date
      t.integer :duration
      t.integer :minimum_players
      t.string :game_type
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :playground, null: false, foreign_key: true

      t.timestamps
    end
  end
end
