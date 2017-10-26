class CreateOrderAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :order_assignments do |t|
      t.references :order, foreign_key: true
      t.references :assignee, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
