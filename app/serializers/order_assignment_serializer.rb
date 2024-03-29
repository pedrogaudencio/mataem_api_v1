class OrderAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :status, :profile
  belongs_to :user
  belongs_to :order

  def profile
    object.user.try(:profile)
  end
end
