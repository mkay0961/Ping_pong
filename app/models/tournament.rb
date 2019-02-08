class Tournament < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :games, through: :rounds
  has_many :players, through: :games
end
