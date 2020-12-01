class Local::BoatJourneyReservationsController < ApplicationController

  def index
    @bj_reservations = BoatJourneyReservation.all
    authorize @bj_reservations
  end

  def edit
  end

  def update
  end

  private

  def bj_reservation_params
    params.require(:boat_journey_reservation).permit(:status)
  end
end
