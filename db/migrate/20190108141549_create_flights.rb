class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.integer :duration
      t.datetime :departure_date

      t.timestamps null: false
    end
  end
end
