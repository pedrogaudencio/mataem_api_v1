class MenuItem < ApplicationRecord
  belongs_to :menu_item_cuisine
  belongs_to :menu_item_category
  belongs_to :vendor
  has_many :choices, class_name: 'ItemChoice', dependent: :destroy

  validates_presence_of :name, :price, :menu_item_cuisine, :menu_item_category
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  def to_s
    self.name
  end
end
