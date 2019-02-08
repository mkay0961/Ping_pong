class TournamentsController < ApplicationController

  # before_action :get_tournaments, only: [:show, :edit, :update, :destroy]

  before_action :get_tournaments, only: [:show, :destroy]

    def index
      @tournaments = Tournament.all
    end

    def new
      @tournament = Tournament.new
    end

    def create

      params[:tournament][:status] = "pending"
      players = []
      params[:player_ids].each do |player|
        players << Player.find(player.to_i)
      end


      byebug

      @tournament = Tournament.create(tournament_params)
      if @tournament.save
        @round = Round.create(num: 1, tournament_id: @tournament.id, status: "pending")
        num_games_round_1 = @tournament.num_players/2
        num_games_round_1.times do |i|
          Game.create(status: "pending", round_id: @round.id, p1_id: players.pop.id , p2_id: players.pop.id)
        end
        byebug
        redirect_to @tournament
       else
         render :new
       end
    end

    def show
    end



    def destroy
      @tournament.destroy
      redirect_to tournaments_path
    end


    private

    def tournament_params
      return params.require(:tournament).permit(:name, :num_players, :status)
    end

    def get_tournaments
      @tournament = Tournament.find(params[:id])
    end





end
