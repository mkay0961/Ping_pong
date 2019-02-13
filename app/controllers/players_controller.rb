class PlayersController < ApplicationController

  before_action :find_player, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @players = Player.active_players
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      @player.active = true
      @player.save
      if @player.img_url.empty? || asset_exists?(@player.img_url) == false
        @player.img_url = "player.png"
        @player.save
      end
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player)
  end

  def search
    search = params[:q]


    @players = []
    Player.all.each do |player|

      if (player.first_name.downcase == search.downcase || player.last_name.downcase == search.downcase || player.nickname.downcase == search.downcase) && player.active == true
        @players<< player
      end
    end

    if @players.empty?

      @players = Player.active_players
    end
  render :index
  end

  def destroy
    @player.active = false
    @player.save
    redirect_to players_path
  end

  private

  def player_params
    # params.require(:player).permit(:first_name, :last_name, :nickname, :img_url).merge(active: true)
    params.require(:player).permit(:first_name, :last_name, :nickname, :img_url)

  end

  def find_player
    @player = Player.find(params[:id])
  end

  def asset_exists?(path)
    begin
      pathname = Rails.application.assets.resolve(path)
      return !!pathname # double-bang turns String into boolean
    rescue Sprockets::FileNotFound
      return false
    end
  end

end
