class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.references :city, foreign_key: true
      t.string :latitude
      t.string :longitude
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
