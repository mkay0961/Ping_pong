class Round < ApplicationRecord
  has_many :games
  has_many :players, through: :games
  belongs_to :tournament

end
