class AddMinOrderValueToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :minimum_order_value, :float, default: nil
  end
end
