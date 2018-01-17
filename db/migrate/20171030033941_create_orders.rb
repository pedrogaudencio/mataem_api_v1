class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :profile, foreign_key: true
      t.references :area, foreign_key: true
      t.references :vendor, foreign_key: true
      t.integer :status, default: 0
      t.string :mobile_number
      t.integer :delivery_type, default: 0
      t.integer :finishing_time, default: 0
      t.float :delivery_charges, default: 0
      t.float :service_fee, default: 0.0
      t.string :order_source
      t.datetime :replied_at
      t.integer :progress_status, default: 0
      t.string :delivery_address
      t.float :total

      t.timestamps
    end
  end
end
