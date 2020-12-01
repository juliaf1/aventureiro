class Local::BoatJourneysController < ApplicationController

  before_action :find_boat_journey, only: [ :edit, :update, :destroy ]
  def new
    @boat_journey = BoatJourney.new
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
  end

  def create
    @boat_journey = BoatJourney.new(boat_journey_params)
    @boat_journey.boat = Boat.find(params[:boat_id])
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
    if @boat_journey.save
      redirect_to local_boats_path
    else
      render :new
    end
  end

  def edit
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
  end

  def update
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
    if @boat_journey.update(boat_journey_params)
      redirect_to local_boats_path, notice: "Your boat has been updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
    @boat_journey.delete
    redirect_to boat_journeys_path
  end

  private

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:id])
  end

  def boat_journey_params
    params.require(:boat_journey).permit(:departure_time, :travel_duration, :price_person)
  end

end
