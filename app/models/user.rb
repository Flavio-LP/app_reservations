class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         ROLES = %w[admin normal]

         def admin?
           role == "admin"
         end

         def normal?
           role == "normal"
         end
end
