class Round < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :players, through: :games
  belongs_to :tournament

end
