class Hours < ActiveRecord::Migration[8.0]
  def change

    create_table :hours do |t|
      t.time :hour

      t.timestamps
    end

    add_index :hours, :id, unique: true
  end
end
