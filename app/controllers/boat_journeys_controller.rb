class BoatJourneysController < ApplicationController

  def index
    @boat_journeys = BoatJourneys.all
  end
  
end
