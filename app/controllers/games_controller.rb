class GamesController < ApplicationController
  before_action :get_game, only: [:show, :set_winner]

  def show

  end

  def set_winner

    if !params[:game][:p1].nil?
      @game.who_won( params[:game][:p1])
    elsif !params[:game][:p2].nil?
      @game.who_won( params[:game][:p2])
    end

    redirect_to @game.round.tournament
  end

  private

  def get_game
    @game = Game.find(params[:id])
  end

end
