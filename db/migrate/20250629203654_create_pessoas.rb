class CreatePessoas < ActiveRecord::Migration[8.0]
  def change
    create_table :pessoas do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome, null: false
      t.string :sobrenome, null: false
      t.string :telefone
      t.string :cpf
      t.date :data_nascimento
      t.text :endereco
      t.boolean :dados_completos, default: false

      t.timestamps
    end

    add_index :pessoas, :cpf, unique: true, where: "cpf IS NOT NULL"
  end
end
