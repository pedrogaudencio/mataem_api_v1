class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :text
      t.integer :sort_order
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
