class RoundsController < ApplicationController
  before_action :get_round, only: [:show]

  def show

  end

  private

  def get_round
    @round = Round.find(params[:id])
  end
end
