class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.references :restaurant
      t.integer :total_clicks, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Advertisement.create_translation_table!(title: :string)
      end

      dir.down do
        Advertisement.drop_translation_table!
      end
    end
  end
end
