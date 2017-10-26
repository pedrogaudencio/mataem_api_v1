class ItemChoice < ApplicationRecord
  enum status: { available: 0, unavailable: 1 }

  belongs_to :menu_item
  has_many :variants, class_name: 'ItemChoiceVariant', dependent: :destroy

  after_create :set_price

  validates_presence_of :name, :status
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :max_variants, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  validate :date_within_limits?

  default_scope { where(status: :available) }
  scope :ending_soon, -> { where(limit_date_until: Date.today..Date.today.in(1.week)) }
  scope :upcoming, -> { where(limit_date_from: Date.tomorrow..Date.today.in(1.week)) }

  def date_within_limits?
    return true if self.limit_date_until.blank?
    if self.limit_date_from > self.limit_date_until
      self.errors.add(:limit_date_from, 'ending date must be after beginning date')
    end
  end

  def to_s
    self.name
  end

  private
    def set_price
      self.price ||= self.menu_item.price
      self.save!
    end

    def self.update_availability
      ItemChoice.where('limit_date_until < ?', Date.today).update(status: :unavailable)
    end
end
