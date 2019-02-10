class Game < ApplicationRecord
  belongs_to :winner, class_name: :Player, optional:  true
  belongs_to :loser, class_name: :Player, optional:  true
  belongs_to :p1, class_name: :Player, optional:  true
  belongs_to :p2, class_name: :Player, optional:  true
  belongs_to :round

  def who_won(winnerid)
    winner = Player.find(winnerid)
    if self.p2 == winner
      self.update(winner: winner, loser: self.p1, status:"Completed")
    elsif self.p1 == winner
      self.update(winner: winner, loser: self.p2, status:"Completed")
    end
    self.round.check_done
  end



end
