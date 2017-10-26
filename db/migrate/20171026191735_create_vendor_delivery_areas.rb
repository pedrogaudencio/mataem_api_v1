class CreateVendorDeliveryAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_delivery_areas do |t|
      t.references :area, foreign_key: true
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
