class AddRestaurantToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :restaurant, foreign_key: true
  end
end
