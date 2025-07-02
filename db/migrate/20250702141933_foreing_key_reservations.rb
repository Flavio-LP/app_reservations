class ForeingKeyReservations < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :pessoa, null: false, foreign_key: true
  end
end