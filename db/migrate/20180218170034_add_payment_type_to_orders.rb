class AddPaymentTypeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :payment_type, :integer, default: 0
  end
end
