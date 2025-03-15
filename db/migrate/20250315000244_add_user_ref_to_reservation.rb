class AddUserRefToReservation < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
  end
end
