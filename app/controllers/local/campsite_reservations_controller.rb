class Local::CampsiteReservationsController < ApplicationController

  def index
    @campsite_reservations = CampsiteReservation.joins(:campsite).where(campsites: { user_id: current_user.id }).sort_by &:check_in

    @upcoming_campsite_reservations = @campsite_reservations.select do |reservation|
      reservation.check_in >= Date.today
    end

    @past_campsite_reservations = @campsite_reservations.select do |reservation|
      reservation.check_in < Date.today
    end

    authorize @campsite_reservations, policy_class: LocalCampsiteReservationPolicy
  end

  def update
    @campsite_reservation = CampsiteReservation.find(params[:id])
    authorize @campsite_reservation, policy_class: LocalCampsiteReservationPolicy
    @campsite_reservation.update(campsite_reservation_params)
    redirect_to local_campsite_reservations_path
  end

  def show
    @campsite_reservation = CampsiteReservation.find(params[:id])
  end

  private

  def campsite_reservation_params
    params.require(:campsite_reservation).permit(:status)
  end
end
