class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :dt_birth

      t.timestamps
    end
  end
end
