class TournamentsController < ApplicationController

  # before_action :get_tournaments, only: [:show, :edit, :update, :destroy]

   before_action :get_tournaments, only: [:show, :destroy]
   before_action :authorized

    # def home
    # end

    def index
      @tournaments = Tournament.all
      @user = User.find(session["user_id"])
    end

    def new
      @tournament = Tournament.new
      @num_players1 = [2,4,8,16,32,64,128]
    end

    def create
      @num_players1 = [2,4,8,16,32,64,128]
      check_players
      params[:tournament][:status] = "pending"
      params[:tournament][:user_id] = @user.id
      players = []

      if Tournament.player_numbers == true
        params[:player_ids].each do |player|
          players << Player.find(player.to_i)
        end
        players = players.shuffle
      end
      @tournament = Tournament.new(tournament_params)
      if @tournament.save
        @round = Round.create(num: 1, tournament_id: @tournament.id, status: "pending")
        num_games_round_1 = @tournament.num_players/2
        num_games_round_1.times do |i|
          Game.create(status: "pending", round_id: @round.id, p1_id: players.pop.id , p2_id: players.pop.id)
        end
        # byebug
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
      return params.require(:tournament).permit(:name, :num_players, :status, :user_id)
    end

    def get_tournaments
      @tournament = Tournament.find(params[:id])
    end

    def check_players
      if params[:player_ids] != nil
        Tournament.player_numbers = params[:player_ids].count == params[:tournament][:num_players].to_i
      else
        Tournament.player_numbers = false
      end
    end

end
