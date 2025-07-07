class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
