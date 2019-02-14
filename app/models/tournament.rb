class Tournament < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :games, through: :rounds
  has_many :players, through: :games
  belongs_to :user
  validates :num_players, presence: true
  validates :num_players, inclusion: { in: [2, 4, 8, 16, 32, 64, 128], message: "must be 2, 4, 6, 8, 16, 32, 64, or 128."}
  validates :name, presence: true, uniqueness: true
  validate :player_number

  cattr_accessor :player_numbers



  def new_round(num)

      winners = self.rounds.last.get_winners
      r = Round.create(num: (num+1), tournament: self, status: "pending")
      r.add_games_to_next_round(winners)



  end
  def get_winner
    winner = self.winner_id
    winner = Player.find(winner)
    return winner
  end

  def set_winner(id)
    winner = Player.find(id)
    self.update(winner_id: winner.id)
  end

  def complete_torn
    self.rounds.last.update(status: "Completed")
    self.update(status: "Completed")
  end

  def player_number
    if Tournament.player_numbers == false
      errors.add(:num_players, ": The number of players selected is inaccurate")
    end
  end

  def get_all_winner
    winner = {}
    self.rounds.each_with_index do |round, i|
      name = "round_"+i.to_s
      winner[name] = {}
      round.games.each_with_index do |game, i|
        gname = "game_"+i.to_s
        winner[name][gname] = game.winner.name
      end
    end
    return winner
  end

  def get_all_loser
    # loser =[]
    loser = {}
    self.rounds.each_with_index do |round, i|
      name = "round_"+i.to_s
      loser[name] = {}
      round.games.each_with_index do |game, i|
        gname = "game_"+i.to_s
        loser[name][gname] = game.loser.name
      end
    end
    return loser
  end




end
