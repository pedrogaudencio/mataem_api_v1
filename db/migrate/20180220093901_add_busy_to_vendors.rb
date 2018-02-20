class AddBusyToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :busy, :boolean, default: false
  end
end
