class AddAttachmentBgImageToRestaurants < ActiveRecord::Migration[5.1]
  def self.up
    change_table :restaurants do |t|
      t.attachment :bg_image
    end
  end

  def self.down
    remove_attachment :restaurants, :bg_image
  end
end
