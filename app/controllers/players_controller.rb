class PlayersController < ApplicationController

  before_action :find_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.active_players
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    @player.active = true
    @player.save
    redirect_to player_path(@player)
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player)
  end

  def destroy
    @player.active = false
    @player.save
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :nickname, :img_url)
  end

  def find_player
    @player = Player.find(params[:id])
  end

end
