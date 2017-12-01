class Restaurant < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  has_many :vendors, dependent: :destroy
  # has_one :working_hours, class_name: 'Biz'
  has_one :social_media, dependent: :destroy
  has_many :orders
  has_many :orders
  has_attached_file :logo
  validates_attachment_content_type :logo, content_type: ["image/jpg",
                                                          "image/jpeg",
                                                          "image/png"]

  before_create :assign_working_hours
  after_create :assign_sort_order

  validates_presence_of :name, :status

  default_scope { order(sort_order: :desc) }
  # TODO: test this filter
  scope :just_opened, -> { where('created_at >= ?', 1.month.ago) }

  delegate :reviews, to: :vendors

  # FIXME: setup working works correctly
  # def setup_working_hours(hours, tz, breaks=nil, holidays=nil)
  #   self.working_hours = Schedule.new do |config|
  #     config.hours = hours
  #     # {
  #     #   mon: {'09:00' => '17:00'},
  #     #   tue: {'00:00' => '24:00'},
  #     #   wed: {'09:00' => '17:00'},
  #     #   thu: {'09:00' => '12:00', '13:00' => '17:00'},
  #     #   sat: {'10:00' => '14:00'}
  #     # }

  #     # 'America/Los_Angeles'
  #     config.time_zone = tz

  #     config.breaks = breaks if breaks
  #     # {
  #     #   Date.new(2006, 1, 2) => {'10:00' => '11:30'},
  #     #   Date.new(2006, 1, 3) => {'14:15' => '14:30', '15:40' => '15:50'}
  #     # }

  #     config.holidays = holidays if holidays
  #     # [Date.new(2016, 1, 1), Date.new(2016, 12, 25)]
  #   end
  #   self.save!
  # end

  def assign_working_hours
    self.opening_hours ||= Date.today.at_beginning_of_day.time
    self.closing_hours ||= Date.today.at_end_of_day.time
    self.weekdays ||= [*0..6]
  end

  def is_open
    self.open?
  end

  def open?
    if not self.weekdays.nil? and self.weekdays.include?(Date.today.wday)
      (self.opening_hours..self.closing_hours).cover?(Time.now)
    end
    false
  end

  def closed?
    not self.open?
  end

  def closing_soon?
  end

  # def on_break?
  #   self.working_hours.on_break?(Time.now)
  # end

  # def on_holiday?
  #   self.working_hours.on_holiday?(Time.now)
  # end

  private
    def assign_sort_order
      if not self.sort_order
        self.sort_order = Restaurant.maximum(:sort_order).to_i + 1
        self.save
      end
    end
end
