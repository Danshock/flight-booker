class CreatePassengerBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_bookings do |t|
      t.integer :booking_id
      t.integer :passenger_id

      t.timestamps null: false
    end
  end
end
