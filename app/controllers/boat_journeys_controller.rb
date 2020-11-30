class BoatJourneysController < ApplicationController

  def index
    @boat_journeys = BoatJourney.all
  end
  
end
