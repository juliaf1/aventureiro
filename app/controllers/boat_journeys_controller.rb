class BoatJourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @boat_journeys = BoatJourney.all
  end

end
