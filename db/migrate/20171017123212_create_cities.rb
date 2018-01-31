class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        City.create_translation_table!(name: :string)
      end

      dir.down do
        City.drop_translation_table!
      end
    end
  end
end
