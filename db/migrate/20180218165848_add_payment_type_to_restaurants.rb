class AddPaymentTypeToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :payment_type, :integer, default: 0
  end
end
