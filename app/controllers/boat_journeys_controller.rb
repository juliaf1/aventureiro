class BoatJourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @boat_journeys = BoatJourney.where('departure_time > ?', DateTime.now)
    @boat_journeys = @boat_journeys.sort_by &:departure_time
    @date = params[:date]
    if @date
      @boat_journeys = @boat_journeys.select do |boat_journey|
        boat_journey.departure_time.to_date == @date.to_date
      end
    end
  end
end
