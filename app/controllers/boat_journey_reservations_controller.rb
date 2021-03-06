class BoatJourneyReservationsController < ApplicationController
  before_action :find_boat_journey, only: [ :new, :create ]

  def index
    @journey_reservations = BoatJourneyReservation.where(user_id: current_user.id).includes(:boat_journey).sort_by { |reservation| reservation.boat_journey.departure_time }
    @past_journey_reservations = @journey_reservations.select { |reservation| reservation.boat_journey.departure_time < Date.today }
    authorize @journey_reservations, policy_class: BoatJourneyReservationPolicy
  end

  def new
    @journey_reservation = BoatJourneyReservation.new
    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy
  end

  def create
    @journey_reservation = BoatJourneyReservation.new(journey_reservation_params)
    @journey_reservation.number_passengers ||= 1
    @journey_reservation.boat_journey = @boat_journey
    @journey_reservation.user = current_user
    @journey_reservation.status = 0

    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy
    if @journey_reservation.save
      # when making this feature live, remember to send user argument with to: tel number
      TwilioWhatsappMessenger.new.boat_request_reservation_message(@journey_reservation)
      redirect_to boat_journey_reservations_path, notice: "Your request has been sent. Please await confirmation from #{@journey_reservation.boat_journey.boat.user.first_name}"
    else
      redirect_to boat_journeys_path, alert: "Couldn't finish your request."
    end
  end

  def destroy
    @journey_reservation = BoatJourneyReservation.find(params[:id])
    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy

    if @journey_reservation.boat_journey.departure_time > Date.today + 2.days
      @journey_reservation.destroy
      # when making this feature live, remember to send user argument with to: tel number
      TwilioWhatsappMessenger.new.boat_cancel_reservation_message(@journey_reservation)
      redirect_to boat_journey_reservations_path, notice: "Your reservation was cancelled."
    else
      redirect_to boat_journey_reservations_path, alert: "You can't cancel without 2 days of notice. Contact #{@journey_reservation.boat_journey.boat.user.first_name} directly."
    end
  end

  private

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:boat_journey_id])
  end

  def journey_reservation_params
    params.require(:boat_journey_reservation).permit(:number_passengers)
  end
end
