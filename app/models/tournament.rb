class Tournament < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :games, through: :rounds
  has_many :players, through: :games


  def new_round(num)

    winner = self.rounds.last.get_winners
    r = Round.create(num: (num.to_i+1).to_s, tournament: self, status: "pending")
    r.add_games_to_next_round(winner)
    
  end



  def complete_torn
    self.update(status: "Completed")
  end





end
