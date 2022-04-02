class Jugador < ApplicationRecord
  has_many  :bets

  validates :nombre, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  validates :total_billetera, presence: true
end
