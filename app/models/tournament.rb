class Tournament < ApplicationRecord
  has_many :rounds
  has_many :games, through: :rounds
  has_many :players, through: :games
end
