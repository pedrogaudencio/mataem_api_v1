class AddBirthdayToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :date_of_birth, :date
  end
end
