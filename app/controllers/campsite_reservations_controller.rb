class CampsiteReservationsController < ApplicationController
  before_action :find_campsite, only: :new

  def index
    @campsite_reservations = CampsiteReservation.where(user_id: current_user.id).includes(:campsite).order(:check_in)
    @past_campsite_reservations = @campsite_reservations.select { |reservation| reservation.check_in < Date.today }
    authorize current_user, policy_class: CampsiteReservationPolicy
  end

  def new
    @campsite_reservation = CampsiteReservation.new
    authorize @campsite_reservation
  end

  def create
    @campsite_reservation = CampsiteReservation.new(reservation_params)
    set_user_campsite_and_status
    set_total_price
    authorize @campsite_reservation
    if @campsite_reservation.save
      # when making this feature live, remember to send user argument with to: tel number
      TwilioWhatsappMessenger.new.campsite_request_reservation_message(@campsite_reservation)
      redirect_to user_campsite_reservations_path(current_user), notice: "Your campsite reservation request is pending confirmation
      from #{@campsite_reservation.campsite.user.first_name}"
    else
      render :new
    end
  end

  def destroy
    @campsite_reservation = CampsiteReservation.find(params[:id])
    authorize @campsite_reservation
    if @campsite_reservation.check_in - Date.today > 1
      @campsite_reservation.destroy
      # when making this feature live, remember to send user argument with to: tel number
      TwilioWhatsappMessenger.new.campsite_cancel_reservation_message(@campsite_reservation)
      redirect_to user_campsite_reservations_path(current_user), notice: "Your reservation was cancelled"
    else
      redirect_to user_campsite_reservations_path(current_user), notice: "You can't cancel your reservation 24h before arrival"
    end
  end

  private

  def find_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end

  def set_user_campsite_and_status
    @campsite_reservation.user = current_user
    @campsite_reservation.campsite = find_campsite
    @campsite_reservation.status = 0
  end

  def set_total_price
    daily_price = @campsite_reservation.number_guests * @campsite_reservation.campsite.daily_price
    @campsite_reservation.total_price = daily_price * (@campsite_reservation.check_out - @campsite_reservation.check_in + 1).to_i
  end

  def reservation_params
    params.require(:campsite_reservation).permit(:check_in, :check_out, :description, :number_guests)
  end
end
