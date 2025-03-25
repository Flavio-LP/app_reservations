class Admin < ApplicationRecord
  # Adicione o devise aqui
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
