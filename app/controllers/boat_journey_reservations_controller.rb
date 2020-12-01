class BoatJourneyReservationsController < ApplicationController
  before_action :find_boat_journey, only: [ :new, :create ]

  def index
    @bj_reservations = BoatJourneyReservation.all
    authorize @bj_reservations
  end

  def new
    @bj_reservation = BoatJourneyReservation.new
    authorize @bj_reservation
  end

  def create
    @bj_reservation = BoatJourneyReservation.new(bj_reservation_params)

    @bj_reservation.boat_journey = @boat_journey
    @bj_reservation.user = current_user
    @bj_reservation.total_price = @bj_reservation.number_passengers * @bj_reservation.boat_journey.price_person
    @bj_reservation.status = 0

    authorize @bj_reservation
    if @bj_reservation.save
      redirect_to boat_journey_reservations_path, notice: "Your request was sent, wait for #{@bj_reservation.boat_journey.boat.user.first_name} confirmation."
    else
      redirect_to boat_journeys_path, alert: "Couldn't finish your request."
    end
  end

  def destroy
    @bj_reservation = BoatJourneyReservation.find(params[:id])
    if @bj_reservation.boat_journey.departure_time - Time.now > 172_800
      @bj_reservation.destroy
      redirect_to boat_journey_reservations_path, notice: "Your reservation was cancelled."
    else
      redirect_to boat_journey_reservations_path, alert: "You can't cancel without 2 days of notice. Contact #{@bj_reservation.boat_journey.boat.user.first_name} directly."
    end
  end

  private

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:boat_journey_id])
  end

  def bj_reservation_params
    params.require(:boat_journey_reservation).permit(:number_passengers)
  end
end
