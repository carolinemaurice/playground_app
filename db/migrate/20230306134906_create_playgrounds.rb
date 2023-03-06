class CreatePlaygrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :playgrounds do |t|
      t.string :name
      t.string :address
      t.string :description
      t.float :rating

      t.timestamps
    end
  end
end
