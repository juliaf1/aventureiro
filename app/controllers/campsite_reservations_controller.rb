class CampsiteReservationsController < ApplicationController
  before_action :find_campsite, only: :new

  def index
    @campsite_reservations = CampsiteReservation.where(user_id: current_user.id)
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
      request_reservation_message
      redirect_to user_campsite_reservations_path(current_user), notice: "Your campsite reservation request is pending confirmation
      from #{@campsite_reservation.campsite.user.first_name}"
    else
      render :new
    end
  end

  def destroy
    @campsite_reservation = CampsiteReservation.find(params[:id])

    if @campsite_reservation.check_in - Date.today > 1
      @campsite_reservation.destroy
      # when making this feature live, remember to send user argument with to: tel number
      cancel_reservation_message
      redirect_to user_campsite_reservations_path(current_user), notice: "Your reservation was cancelled"
    else
      redirect_to user_campsite_reservations_path(current_user), notice: "You can't cancel your reservation 24h before arrival"
    end
  end

  private

  def cancel_reservation_message
    message = " #{@campsite_reservation.user.first_name} has cancelled their reservation
    In: #{@campsite_reservation.check_in} / Out: #{@campsite_reservation.check_out}
    for #{@campsite_reservation.number_guests}, Total: #{@campsite_reservation.total_price}.
      Description: #{@campsite_reservation.description}"
    TwilioWhatsappMessenger.new(message).send_whatsapp
  end

  def request_reservation_message
    message = "New Reservation by: #{@campsite_reservation.user.first_name}
    In: #{@campsite_reservation.check_in} / Out: #{@campsite_reservation.check_out}
    for #{@campsite_reservation.number_guests}, Total: #{@campsite_reservation.total_price}.
      Description: #{@campsite_reservation.description} Respond Yes/No to accept or decline. "
    TwilioWhatsappMessenger.new(message).send_whatsapp
  end

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
