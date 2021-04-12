class AddDeletedAtToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :deleted_at, :datetime
  end
end
