class Roullette < ApplicationRecord
  has_many  :rounds, dependent: :destroy
end
