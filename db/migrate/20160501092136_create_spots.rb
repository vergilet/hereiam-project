class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :title, null: false
      t.text :description
      t.integer :user_id, null: false
      t.datetime :expiration_datetime
      t.boolean :expired

      t.timestamps
    end
  end
end
