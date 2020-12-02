class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    authorize @boats
  end
end
