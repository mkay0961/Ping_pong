class Game < ApplicationRecord
  belongs_to :winner, class_name: :Player, optional:  true
  belongs_to :loser, class_name: :Player, optional:  true
  belongs_to :p1, class_name: :Player, optional:  true
  belongs_to :p2, class_name: :Player, optional:  true
  belongs_to :round


end
