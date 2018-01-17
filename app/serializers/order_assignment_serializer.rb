class OrderAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :status
  belongs_to :user
  belongs_to :order
end
