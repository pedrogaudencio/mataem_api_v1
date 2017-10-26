class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.string :mobile_number
      t.string :subject

      t.timestamps
    end
  end
end
