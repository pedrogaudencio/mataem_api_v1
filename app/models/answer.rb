class Answer < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  belongs_to :question

  after_create :assign_sort_order

  validates_presence_of :text, :status

  translates :text, fallbacks_for_empty_translations: true

  private
    def assign_sort_order
      if not self.sort_order
        self.sort_order = self.question.answers.maximum(:sort_order).to_i + 1
        self.save
      end
    end
end
