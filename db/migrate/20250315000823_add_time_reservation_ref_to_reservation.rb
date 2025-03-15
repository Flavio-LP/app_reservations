class AddTimeReservationRefToReservation < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :time_reservation, null: false, foreign_key: true
  end
end
