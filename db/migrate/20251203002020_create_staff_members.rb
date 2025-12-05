class CreateStaffMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :staff_members do |t|
      t.string :name
      t.string :department
      t.integer :years_of_service
      t.string :employment_status

      t.timestamps
    end
  end
end
