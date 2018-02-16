class MenuItem < ApplicationRecord
  belongs_to :menu_item_cuisine
  belongs_to :menu_item_category
  belongs_to :vendor
  has_many :choices, class_name: 'ItemChoice', dependent: :destroy
  has_attached_file :image

  translates :name, :description, :ingredients, fallbacks_for_empty_translations: true

  validates_presence_of :name, :price, :menu_item_cuisine, :menu_item_category
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  validates_attachment_content_type :image, content_type: ["image/jpg",
                                                           "image/jpeg",
                                                           "image/png"]


  def to_s
    self.name
  end
end
