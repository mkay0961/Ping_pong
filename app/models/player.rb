class Player < ApplicationRecord
  has_many :games_as_p1, class_name: :Game, foreign_key: :p1_id
  has_many :games_as_p2, class_name: :Game, foreign_key: :p2_id
  has_many :rounds, through: :games
  has_many :tournaments, through: :rounds
  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

  def games
    self.games_as_p1 + self.games_as_p2
  end

  def win?(game)
    if game.winner == self
      "won"
    elsif game.loser == self
      "lost"
    else
      "playing"
    end
  end

  def self.active_players
    self.all.select do |player|
      player.active
    end
  end

  def add_point
    self.update(points: (self.points + 1))
  end

  def self.ranks
    ranks = []
    ranks = Player.active_players.sort_by {|player| player.points}
    return ranks.reverse
  end

  def game_win_percentage
    games = self.games.select do |game|
      game.status == "Completed"
    end
    games_played = games.count
    if games_played == 0
      "No Stats"
    else
      games_won = 0
      games.each do |game|
        if game.winner == self
          games_won+=1
        end
      end

      percent = ( games_won.to_f/games_played)*100
    return percent.to_s + "%"
    end
  end

  def tour_win_percentage
    tourn = self.games.select do |game|
      game.round.tournament.status == "Completed"
    end
    tour_played = tourn.uniq.count
    if tour_played == 0
      "No Stats"
    else
      tour_won = 0
      tourn.uniq.each do |tour|
        if tour.winner_id == self.id
          tour_won+=1
        end
      end

      percent = ( tour_won.to_f/tour_played)*100
      return percent.to_s + "%"
    end
  end

  def default_image
    arr = ["cat1.jpg", "cat2.jpg", "cat3.jpg", "cat4.jpg", "cat7.jpeg", "dog1.png", "dog2.png", "dog3.jpg",
            "dog4.jpg", "dog6.jpg", "horse.jpg", "lizard.jpg", "monkey.jpg", "squirrel.jpg"]
    self.img_url = arr.sample
  end


end
