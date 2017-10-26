class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :sort_order, :status
  has_many :answers
end
