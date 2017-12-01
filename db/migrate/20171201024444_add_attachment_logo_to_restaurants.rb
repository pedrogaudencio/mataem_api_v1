class AddAttachmentLogoToRestaurants < ActiveRecord::Migration[5.1]
  def self.up
    change_table :restaurants do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :restaurants, :logo
  end
end
