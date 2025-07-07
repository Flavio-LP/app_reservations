class AddHourToReservations < ActiveRecord::Migration[8.0]
  def change
    # 2) Cria a tabela hours
    create_table :hours do |t|
      t.time :hour, null: false
      t.timestamps
    end


    # 3) Só depois adiciona a foreign_key em reservations
    add_reference :reservations, :hour, foreign_key: true
  end
end
