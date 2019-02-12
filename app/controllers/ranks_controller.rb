class RanksController < ApplicationController


  def index
    @ranks = Player.ranks

  end

end
