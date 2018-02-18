class AddVendorToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_reference :advertisements, :vendor, foreign_key: true
  end
end
