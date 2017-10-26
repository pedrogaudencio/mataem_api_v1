class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :sort_order
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
