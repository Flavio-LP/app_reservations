class CreateTable < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.integer :number_table
      t.integer :occupants

      t.timestamps
    end

    add_index :tables, :id, unique: true
  end
end
