class Droptablehours < ActiveRecord::Migration[8.0]
  def change
      drop_table :hours
  end
end
