class Tournament < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :games, through: :rounds
  has_many :players, through: :games
  validates :num_players, presence: true
  validates :name, presence: true, uniqueness: true
  validate :player_number

  cattr_accessor :player_numbers



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
    self.update(winner_id: winner.id)
  end

  def complete_torn
    self.update(status: "Completed")
  end

  def player_number
    if Tournament.player_numbers != true
      errors.add(:num_players, ": The number of players selected is inaccurate")
    end
  end





end
