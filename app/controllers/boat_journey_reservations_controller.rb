class BoatJourneyReservationsController < ApplicationController
  before_action :find_boat_journey, only: [ :new, :create ]

  def index
    @journey_reservations = BoatJourneyReservation.all
    authorize @journey_reservations
  end

  def new
    @journey_reservation = BoatJourneyReservation.new
    authorize @journey_reservation
  end

  def create
    @journey_reservation = BoatJourneyReservation.new(journey_reservation_params)

    @journey_reservation.boat_journey = @boat_journey
    @journey_reservation.user = current_user
    @journey_reservation.total_price = @journey_reservation.number_passengers * @journey_reservation.boat_journey.price_person
    @journey_reservation.status = 0

    authorize @journey_reservation
    if @journey_reservation.save
      redirect_to boat_journey_reservations_path, notice: "Your request was sent, wait for #{@journey_reservation.boat_journey.boat.user.first_name} confirmation."
    else
      redirect_to boat_journeys_path, alert: "Couldn't finish your request."
    end
  end

  def destroy
    @journey_reservation = BoatJourneyReservation.find(params[:id])
    if @journey_reservation.boat_journey.departure_time - Time.now > 172_800
      @journey_reservation.destroy
      redirect_to boat_journey_reservations_path, notice: "Your reservation was cancelled."
    else
      redirect_to boat_journey_reservations_path, alert: "You can't cancel without 2 days of notice. Contact #{@bj_reservation.boat_journey.boat.user.first_name} directly."
    end
  end

  private

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:boat_journey_id])
  end

  def journey_reservation_params
    params.require(:boat_journey_reservation).permit(:number_passengers)
  end
end
