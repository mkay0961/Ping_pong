class Player < ApplicationRecord
  has_many :games
  has_many :rounds, through: :games
  has_many :tournaments, through: :rounds
  
end
