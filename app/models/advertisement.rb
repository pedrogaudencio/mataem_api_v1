class Advertisement < ApplicationRecord
  belongs_to :restaurant
  belongs_to :vendor

  enum size: { large: 0, small: 1 }

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg",
                                                          "image/jpeg",
                                                          "image/png"]

  validates_presence_of :title, :restaurant

  translates :title, fallbacks_for_empty_translations: true
end
