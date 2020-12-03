class BoatsController < ApplicationController
  def index
    @boats = Boat.includes(:user)
    authorize @boats
  end
end
