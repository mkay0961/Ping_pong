class RanksController < ApplicationController
  before_action :authorized

  def index
    @ranks = Player.ranks

  end

end
