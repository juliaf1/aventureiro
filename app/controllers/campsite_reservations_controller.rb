class CampsiteReservationsController < ApplicationController
  def new
    @campsite_reservation = CampsiteReservation.new
  end

  def create
    @campsite_reservation = CampsiteReservation.new(reservation_params)
    @campsite_reservation.user = current_user
    @campsite_reservation.campsite_id = params[:campsite_id]
    if @campsite_reservation.save
      # Maybe should redirect to My Reservations?
      redirect_to boat_journeys_path
    else
      render :new, notice: @campsite_reservation.errors.messages.to_s
    end
  end

  private

  def reservation_params
    params.require(:campsite_reservation).permit(:check_in, :check_out, :description, :number_guests)
  end
end
