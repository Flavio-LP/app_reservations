class CreateTimeReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :time_reservations do |t|
      t.string :hour
      t.integer :active

      t.timestamps
    end
  end
end
