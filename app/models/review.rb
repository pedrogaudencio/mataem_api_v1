class Review < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  belongs_to :vendor
  belongs_to :user

  before_validation do
    self.user = current_user
  end

  validates_presence_of :user, :status, :rating, :comment, :order_packaging, :value_for_money, :delivery_time, :food_quality

  default_scope { where(status: :accepted) }
end
