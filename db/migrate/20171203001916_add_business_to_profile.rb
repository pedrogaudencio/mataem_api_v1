class AddBusinessToProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :restaurant, foreign_key: true, nil: true
  end
end
