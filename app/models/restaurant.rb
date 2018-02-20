class Restaurant < ApplicationRecord
  include Tod

  enum status: { active: 0, inactive: 1 }
  enum restaurant_type: { veg_both: 0, veg: 1, non_veg: 2 }
  enum payment_type: { payment_both: 0, cod: 1, online: 2 }

  has_many :vendors, dependent: :destroy
  has_one :social_media, dependent: :destroy
  has_many :orders
  has_many :orders
  has_attached_file :logo
  has_attached_file :bg_image

  translates :name, fallbacks_for_empty_translations: true

  after_create :assign_sort_order, :assign_working_hours

  validates_presence_of :name, :status
  validates_attachment_content_type :logo, content_type: ["image/jpg",
                                                          "image/jpeg",
                                                          "image/png"]

  validates_attachment_content_type :bg_image, content_type: ["image/jpg",
                                                              "image/jpeg",
                                                              "image/png"]

  default_scope { order(sort_order: :desc) }

  scope :just_opened, -> { where('created_at >= ?', 1.month.ago) }

  delegate :reviews, to: :vendors

  def staff
    Profile.where(business: self).first
  end

  def is_open
    self.open?
  end

  def open?
    if not self.weekdays.nil? and self.weekdays.include?(Date.today.wday)
      return Tod::Shift.new(Tod::TimeOfDay.parse(self.opening_hours),
                            Tod::TimeOfDay.parse(self.closing_hours)).include?(
                            Tod::TimeOfDay.new(Time.now.hour, Time.now.min))
    end
    return false
  end

  def closed?
    not self.open?
  end

  def closing_soon?
    if self.is_open
      return Tod::Shift.new(Tod::TimeOfDay.new(Time.now.hour, Time.now.min),
                            Tod::TimeOfDay.new(self.closing_hours)).duration < 3600
    end
    return false
  end

  private
    def assign_sort_order
      if not self.sort_order
        self.sort_order = Restaurant.maximum(:sort_order).to_i + 1
        self.save!
      end
    end

  def assign_working_hours
    self.opening_hours ||= 8
    self.closing_hours ||= 23
    self.weekdays ||= [*0..6]
    self.save!
  end
end
