class Advertisement < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg",
                                                          "image/jpeg",
                                                          "image/png"]

  validates_presence_of :title, :restaurant
end
