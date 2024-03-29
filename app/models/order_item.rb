class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  before_save :set_price

  validates_presence_of :order, :menu_item

  def add_item_variant(variant_id)
    self.variants << variant_id
    self.save!
  end

  def list_item_variants
    self.variants.map { |i| ItemChoiceVariant.find(i) }
  end

  private
    def set_price
      if self.item_choice_variants and not self.item_choice_variants.empty?
        self.price = self.item_choice_variants.inject(0.0) { |total, variant_id|
          total + (ItemChoiceVariant.find(variant_id).price * self.quantity)
        }
      else
        self.price = self.menu_item.price * self.quantity
      end
    end
end
