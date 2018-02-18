class AddDeliveryTimeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivery_datetime, :datetime
  end
end
