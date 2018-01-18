class CreateOrderAssignmentIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :order_assignment_issues do |t|
      t.references :order, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
