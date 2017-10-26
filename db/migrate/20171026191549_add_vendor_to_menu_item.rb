class AddVendorToMenuItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :menu_items, :vendor, foreign_key: true
  end
end
