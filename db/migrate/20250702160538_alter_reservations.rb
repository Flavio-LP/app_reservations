class AlterReservations < ActiveRecord::Migration[8.0]
  def change
     add_column :reservations, :start_time , :time
     add_column :reservations, :end_time , :time
     remove_column :reservations, :hour
  end
end
