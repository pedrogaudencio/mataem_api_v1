class City < ApplicationRecord
  has_many :areas, dependent: :destroy

  enum status: { active: 0, inactive: 1 }

  validates_presence_of :name, :status
end
