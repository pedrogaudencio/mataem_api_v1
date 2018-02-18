class AddTypeToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :restaurant_type, :integer, default: 0
  end
end
