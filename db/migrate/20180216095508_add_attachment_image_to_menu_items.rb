class AddAttachmentImageToMenuItems < ActiveRecord::Migration[5.1]
  def self.up
    change_table :menu_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :menu_items, :image
  end
end
