class Game < ApplicationRecord
  belongs_to :winner, class_name: :Player, optional:  true
  belongs_to :loser, class_name: :Player, optional:  true
  belongs_to :p1, class_name: :Player, optional:  true
  belongs_to :p2, class_name: :Player, optional:  true
  belongs_to :round

  def who_won(playerid)
    player = Player.find(playerid)
    if self.p2 == player
      self.update(winner: player, loser: self.p1, status:"Completed")
    elsif self.p1 == player
      self.update(winner: player, loser: self.p2, status:"Completed")
    end
    self.round.check_done
  end

  

end
