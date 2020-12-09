class Local::BoatJourneysController < ApplicationController

  before_action :find_boat_journey, only: [ :edit, :update, :destroy ]

  def index
    @boat_journeys = BoatJourney.joins(:boat).where(boats: { user_id: current_user.id }).sort_by &:departure_time
    authorize @boat_journeys, policy_class: LocalBoatJourneyPolicy
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @boat_journey = BoatJourney.new
    authorize_boat_journey
  end

  def create
    @boat_journey = BoatJourney.new(boat_journey_params)
    @boat_journey.boat = Boat.find(params[:boat_id])
    authorize_boat_journey
    if @boat_journey.save
      redirect_to local_boat_journeys_path
    else
      render :new
    end
  end

  def edit
    authorize_boat_journey
  end

  def update
    authorize_boat_journey
    if @boat_journey.update(boat_journey_params)
      redirect_to local_boat_journeys_path, notice: "Your boat has been updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize_boat_journey
    @boat_journey.destroy
    redirect_to local_boat_journeys_path
  end

  private

  def authorize_boat_journey
    authorize @boat_journey, policy_class: LocalBoatJourneyPolicy
  end

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:id])
  end

  def boat_journey_params
    params.require(:boat_journey).permit(:departure_time, :travel_duration, :price_person)
  end

end
