class RoundsController < ApplicationController
  before_action :get_round, only: [:show]
  before_action :authorized

  def show

  end

  private

  def get_round
    @round = Round.find(params[:id])
  end
end
