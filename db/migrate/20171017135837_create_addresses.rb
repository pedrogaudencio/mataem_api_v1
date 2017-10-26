class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :address_type, default: 0
      t.string :building
      t.string :number
      t.string :street
      t.string :floor
      t.references :area, foreign_key: true #, nil: true

      t.timestamps
    end
  end
end
