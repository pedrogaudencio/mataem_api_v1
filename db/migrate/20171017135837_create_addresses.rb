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

    reversible do |dir|
      dir.up do
        Address.create_translation_table!(building: :string,
                                          number: :string,
                                          street: :string,
                                          floor: :string)
      end

      dir.down do
        Address.drop_translation_table!
      end
    end
  end
end
