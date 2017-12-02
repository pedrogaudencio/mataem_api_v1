class AddWorkHoursToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :opening_hours, :string
    add_column :restaurants, :closing_hours, :string
    add_column :restaurants, :weekdays, :integer, array: true, default: []
  end
end
