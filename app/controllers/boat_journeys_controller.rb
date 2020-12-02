class BoatJourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @boat_journeys = BoatJourney.all
    @boat_journeys = @boat_journeys.select do |boat_journey|
      boat_journey.departure_time.to_date == params[:date].to_date
    end
    @date = params[:date]
  end
end
