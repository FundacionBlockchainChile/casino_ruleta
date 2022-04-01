class Jugador < ApplicationRecord
  validates :nombre, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  validates :total_billetera, presence: true
end
