class CampsiteReservationsController < ApplicationController
  def index
    @campsite_reservations = CampsiteReservation.all
    authorize current_user, policy_class: CampsiteReservationPolicy
  end

  def new
    @campsite_reservation = CampsiteReservation.new
    @campsite = Campsite.find(params[:campsite_id])
    authorize @campsite_reservation
  end

  def create
    @campsite_reservation = CampsiteReservation.new(reservation_params)
    @campsite_reservation.user = current_user
    @campsite_reservation.campsite_id = params[:campsite_id]
    @campsite_reservation.status = 0
    @campsite_reservation.total_price = @campsite_reservation.number_guests * @campsite_reservation.campsite.daily_price
    authorize @campsite_reservation
    if @campsite_reservation.save
      redirect_to user_campsite_reservations_path(current_user), notice: "Your campsite reservation request was sent to:
       #{@campsite_reservation.campsite.user.first_name}, please await the confirmation in the following days."
    else
      render :new, notice: @campsite_reservation.errors.messages.to_s
    end
  end

  def destroy
    @campsite_reservation = CampsiteReservation.find(params[:id])

    if @campsite_reservation.check_in - Date.today > 86_400
      redirect_to user_campsite_reservations_path(current_user), notice: "Your reservation was cancelled"
    else
      redirect_to user_campsite_reservations_path(current_user), notice: "You can't cancel your reservation 24h previous to the check-in time"
    end
  end

  private

  def reservation_params
    params.require(:campsite_reservation).permit(:check_in, :check_out, :description, :number_guests)
  end
end
