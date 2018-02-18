class AddDatesToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :start_date, :date
    add_column :advertisements, :end_date, :date
  end
end
