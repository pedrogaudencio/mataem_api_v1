class OrderAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_one :assignee
end
