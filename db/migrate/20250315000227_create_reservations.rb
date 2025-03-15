class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.integer :person
      t.timestamp :created_at

    end
  end
end
