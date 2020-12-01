class Local::BoatJourneyReservationsController < ApplicationController

  def index
    @bj_reservations = BoatJourneyReservation.joins(boat_journey: :boat).where(boats: { user_id: current_user.id })
    authorize @bj_reservations, policy_class: LocalBoatJourneyReservationPolicy
  end

  def update
    @bj_reservation = BoatJourneyReservation.find(params[:id])
    authorize @bj_reservation, policy_class: LocalBoatJourneyReservationPolicy
    @bj_reservation.update(bj_reservation_params)
    redirect_to local_boat_journey_reservations_path
  end

  private

  def bj_reservation_params
    params.require(:boat_journey_reservation).permit(:status)
  end
end
