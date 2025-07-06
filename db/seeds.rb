   # This file should ensure the existence of records required to run the application in every environment (production,
   # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
   # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
   #
   # Example:

   #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
   #     MovieGenre.find_or_create_by!(name: genre_name)
   #   end

   user = User.create!(
     email: "flavio1@teste.com",
     password: "123456",
     password_confirmation: "123456",
     admin: true
   )

   user1 = User.create!(
    email: "flavio@teste.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false
  )


 # Garante que sempre crie (ou encontre) as mesas abaixo
 tables_data = [
   { number_table: 1, occupants: 5 },
   { number_table: 2, occupants: 7 },
   { number_table: 3, occupants: 4 },
   { number_table: 4, occupants: 6 },
   { number_table: 5, occupants: 3 }
 ]

 tables_data.each do |attrs|
   Table.find_or_create_by!(attrs)
 end

%w[18:00 19:00 20:00 21:00 22:00 23:00].each do |time_str|
  # insere ou encontra pelo atributo `hour`, que é a coluna da tabela
  Hour.find_or_create_by!(hour: time_str)
end
