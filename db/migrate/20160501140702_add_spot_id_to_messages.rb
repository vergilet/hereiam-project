class AddSpotIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :spot_id, :integer, null: false
  end
end
