class OrderAssignment < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  belongs_to :assignee, class_name: 'User'
  has_one :order
end
