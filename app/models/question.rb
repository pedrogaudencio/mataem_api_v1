class Question < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  has_many :answers, dependent: :destroy

  after_create :assign_sort_order

  validates_presence_of :text, :status

  translates :text, fallbacks_for_empty_translations: true

  private
    def assign_sort_order
      if not self.sort_order
        self.sort_order = Question.maximum(:sort_order).to_i + 1
        self.save
      end
    end
end
