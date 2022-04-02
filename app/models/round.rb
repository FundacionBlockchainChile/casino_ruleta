class Round < ApplicationRecord
  has_many  :bets, dependent: :destroy
  belongs_to :roullette
end
