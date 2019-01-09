class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :location

      t.timestamps null: false
    end
  end
end
