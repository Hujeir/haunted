class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :confirmation_number
      t.string :guest_name
      t.integer :room_number
      t.date :check_in_date
      t.date :check_out_date
      t.string :status

      t.timestamps
    end
  end
end
