class AddIndexToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_index :restaurants, :deleted_at
  end
end
