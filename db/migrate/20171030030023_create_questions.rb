class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :sort_order
      t.integer :status, default: 0

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Question.create_translation_table!(text: :string)
      end

      dir.down do
        Question.drop_translation_table!
      end
    end
  end
end
