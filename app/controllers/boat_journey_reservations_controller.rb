class BoatJourneyReservationsController < ApplicationController
  before_action :find_boat_journey, only: [ :new, :create ]

  def index
    @journey_reservations = BoatJourneyReservation.all.sort_by { |reservation| reservation.boat_journey.departure_time }
    authorize @journey_reservations, policy_class: BoatJourneyReservationPolicy
  end

  def new
    @journey_reservation = BoatJourneyReservation.new
    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy
  end

  def create
    @journey_reservation = BoatJourneyReservation.new(journey_reservation_params)

    @journey_reservation.boat_journey = @boat_journey
    @journey_reservation.user = current_user
    @journey_reservation.total_price = @journey_reservation.number_passengers * @journey_reservation.boat_journey.price_person
    @journey_reservation.status = 0

    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy
    if @journey_reservation.save
      # when making this feature live, remember to send user argument with to: tel number
      request_reservation_message
      redirect_to boat_journey_reservations_path, notice: "Your request was sent, wait for #{@journey_reservation.boat_journey.boat.user.first_name} confirmation."
    else
      redirect_to boat_journeys_path, alert: "Couldn't finish your request."
    end
  end

  def destroy
    @journey_reservation = BoatJourneyReservation.find(params[:id])
    authorize @journey_reservation, policy_class: BoatJourneyReservationPolicy
    if @journey_reservation.boat_journey.departure_time - Time.now > 172_800
      @journey_reservation.destroy
      # when making this feature live, remember to send user argument with to: tel number
      cancel_reservation_message
      redirect_to boat_journey_reservations_path, notice: "Your reservation was cancelled."
    else
      redirect_to boat_journey_reservations_path, alert: "You can't cancel without 2 days of notice. Contact #{@journey_reservation.boat_journey.boat.user.first_name} directly."
    end
  end

  private

  def request_reservation_message
    message = "New Reservation by: #{@journey_reservation.user.first_name}
    Departure: #{@journey_reservation.departure_time}
    for #{@journey_reservation.number_passengers}, Total: #{@journey_reservation.total_price}.
    Respond Yes/No to accept or decline. "
    TwilioWhatsappMessenger.new(message).send_whatsapp
  end

  def cancel_reservation_message
    message = "#{@journey_reservation.user.first_name.capitalize} has cancelled their reservation
    Departure: #{@journey_reservation.departure_time}
    for #{@journey_reservation.number_passengers}, Total: #{@journey_reservation.total_price}."
    TwilioWhatsappMessenger.new(message).send_whatsapp
  end

  def find_boat_journey
    @boat_journey = BoatJourney.find(params[:boat_journey_id])
  end

  def journey_reservation_params
    params.require(:boat_journey_reservation).permit(:number_passengers)
  end
end
