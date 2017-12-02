class OrderAssignment < ApplicationRecord
  enum status: { pending: 0, accepted: 1 }

  belongs_to :assignee, class_name: 'User'
  belongs_to :order
end
