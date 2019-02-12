class Player < ApplicationRecord
  has_many :games_as_p1, class_name: :Game, foreign_key: :p1_id
  has_many :games_as_p2, class_name: :Game, foreign_key: :p2_id
  has_many :rounds, through: :games
  has_many :tournaments, through: :rounds
  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :img_url, uniqueness: true, unless: Proc.new {|a| a.img_url.blank? }

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



end
