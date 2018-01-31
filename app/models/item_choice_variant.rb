class ItemChoiceVariant < ApplicationRecord
  belongs_to :item_choice

  validates_presence_of :name
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validate :variants_within_limits?
  validates_associated :item_choice

  translates :name, fallbacks_for_empty_translations: true

  def variants_within_limits?
    return true if self.item_choice.max_variants.nil? or self.item_choice.variants.empty?
    if self.item_choice.variants.count == self.item_choice.max_variants
      self.errors[:base] << "\"#{self.item_choice}\" variants can't be more than #{self.item_choice.max_variants}"
    end
  end

  def to_s
    self.name
  end
end
