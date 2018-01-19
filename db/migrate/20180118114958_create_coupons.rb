class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :value, default: 0.0
      t.datetime :expiry_date
      t.references :order
      t.integer :discount_type, default: 0
      t.float :maximum_redeem_amount
      t.float :min_order_value, default: 0.0
      t.integer :app_type, default: 2
      t.integer :user_type, default: 1
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
