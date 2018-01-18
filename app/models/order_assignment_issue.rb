class OrderAssignmentIssue < ApplicationRecord
  belongs_to :order

  validates_presence_of :comment
end
