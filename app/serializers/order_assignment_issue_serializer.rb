class OrderAssignmentIssueSerializer < ActiveModel::Serializer
  attributes :id, :comment
  has_one :order
end
