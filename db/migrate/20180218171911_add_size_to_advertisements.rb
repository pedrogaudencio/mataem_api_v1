class AddSizeToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :size, :integer, default: 1
  end
end
