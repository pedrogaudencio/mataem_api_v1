class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :sort_order, :status
  has_one :question
end
