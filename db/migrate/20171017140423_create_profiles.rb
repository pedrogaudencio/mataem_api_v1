class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.boolean :mobile_number_verified, default: false
      t.string :mobile_verification_code
      t.references :address, foreign_key: true
      t.integer :status, default: 0
      t.integer :loyalty_points, default: 0

      t.timestamps
    end
  end
end
