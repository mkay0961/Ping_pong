class Tournament < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :games, through: :rounds
  has_many :players, through: :games


  def new_round(num)

    if self.status == "pending"
      winner = self.rounds.last.get_winners
      r = Round.create(num: (num+1), tournament: self, status: "pending")
      r.add_games_to_next_round(winner)
    elsif self.status == "Completed"
      byebug
    end


  end

  def set_winner(id)
    winner = Player.find(id)
  end

  def complete_torn
    self.update(status: "Completed")
  end





end
