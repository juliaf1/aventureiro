class Local::BoatJourneyReservationsController < ApplicationController

  def index
    @journey_reservations = BoatJourneyReservation.joins(boat_journey: :boat).where(boats: { user_id: current_user.id })
    @past_journey_reservations = @journey_reservations.select { |reservation| reservation.boat_journey.departure_time < Date.today }
    @upcoming_jounrey_reservations = @journey_reservations.select { |reservation| reservation.boat_journey.departure_time > Date.today }
    
    authorize @journey_reservations, policy_class: LocalBoatJourneyReservationPolicy
  end

  def update
    @journey_reservation = BoatJourneyReservation.find(params[:id])
    authorize @journey_reservation, policy_class: LocalBoatJourneyReservationPolicy
    @journey_reservation.update(journey_reservation_params)
    redirect_to local_boat_journey_reservations_path
  end

  private

  def journey_reservation_params
    params.require(:boat_journey_reservation).permit(:status)
  end
end
