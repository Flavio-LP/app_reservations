class AddDateToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :date, :date, null: false, default: Date.today
    # opcional: se quiser indexar para consultas rápidas
    add_index  :reservations, [ :table_id, :date ]
  end
end
