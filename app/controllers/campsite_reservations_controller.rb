class CampsiteReservationsController < ApplicationController
  before_action :find_campsite, only: [ :new, :create ]

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
    @campsite_reservation.number_guests ||= 1
    set_user_campsite_and_status(@campsite_reservation, @campsite)
    authorize @campsite_reservation

    if confirm_check_in(@campsite_reservation) && confirm_check_out(@campsite_reservation) && confirm_straddle(@campsite_reservation)
      if @campsite_reservation.save
        # when making this feature live, remember to send user argument with to: tel number
        TwilioWhatsappMessenger.new.campsite_request_reservation_message(@campsite_reservation)
        redirect_to user_campsite_reservations_path(current_user), notice: "Your request has been sent. Please await confirmation from #{@campsite_reservation.campsite.user.first_name}"
      else
        render :new
      end
    else
      redirect_to new_campsite_campsite_reservation_path(@campsite), notice: "The dates you selected are fully booked"
    end
  end

  def destroy
    @campsite_reservation = CampsiteReservation.find(params[:id])
    authorize @campsite_reservation
    if @campsite_reservation.destroy
      # when making this feature live, remember to send user argument with to: tel number
      TwilioWhatsappMessenger.new.campsite_cancel_reservation_message(@campsite_reservation)
      redirect_to user_campsite_reservations_path(current_user), notice: "Your reservation was cancelled"
    else
      redirect_to user_campsite_reservations_path(current_user)
    end
  end

  private

  def confirm_check_in(campsite_reservation)
    campsite_reservation.campsite.full_periods.all? do |period|
      period.end_date < campsite_reservation.check_in || period.start_date > campsite_reservation.check_in
    end
  end

  def confirm_check_out(campsite_reservation)
    campsite_reservation.campsite.full_periods.all? do |period|
      period.end_date < campsite_reservation.check_out || period.start_date > campsite_reservation.check_out
    end
  end

  def confirm_straddle(campsite_reservation)
    !campsite_reservation.campsite.full_periods.any? do |period|
      campsite_reservation.check_in < period.start_date && period.end_date < campsite_reservation.check_out
    end
  end

  def find_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end

  def set_user_campsite_and_status(campsite_reservation, campsite)
    campsite_reservation.user = current_user
    campsite_reservation.campsite = campsite
    campsite_reservation.status = 0
  end

  def reservation_params
    params.require(:campsite_reservation).permit(:check_in, :check_out, :description, :number_guests)
  end
end
