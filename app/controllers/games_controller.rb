class GamesController < ApplicationController
  before_action :get_game, only: [:show, :set_winner]

  def show

  end

  def set_winner
    if @game.p1.id == params[:format].to_i
      @game.who_won( params[:format])
    elsif @game.p2.id == params[:format].to_i
      @game.who_won( params[:format])
    end

    redirect_to @game.round.tournament
  end

  private

  def get_game
    @game = Game.find(params[:id])
  end

end
