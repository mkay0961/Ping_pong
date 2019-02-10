class Round < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :players, through: :games
  belongs_to :tournament

  def check_done


    # here add if
    # byebug
    t = self.games.all? {|game| game.status == "Completed"}
    if t && self.games.size == 1
      self.tournament.set_winner(self.games.last.winner.id)
      self.tournament.complete_torn
      # byebug
    elsif t

      self.complete_round
      self.tournament.new_round(self.num)

    end

  end

  def complete_round
    self.update(status: "Completed")
  end

  def add_games_to_next_round(winners)

    if winners.size % 2 == 0

      number_of_games = winners.size / 2
      number_of_games.times do

        g = Game.create(p1: winners.shift, p2: winners.shift, status: "pending", round: self)

      end
    end

  end


  def get_winners
    array = []
    self.games.each do |game|
      array << game.winner
    end
    return array

  end

end
