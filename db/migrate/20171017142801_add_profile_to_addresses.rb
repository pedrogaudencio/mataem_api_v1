class AddProfileToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :profile, foreign_key: true, nil: true
  end
end
