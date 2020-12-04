class TwilioWhatsappMessenger
  # when making this feature live, remember to send user argument with to: tel number
  def send_whatsapp(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
      {
        from: "whatsapp:#{ENV['TWILIO_PHONE_NUMBER']}",
        to: "whatsapp:#{ENV['TEST_LOCAL_NUMBER']}",
        body: message
      }
    )
  end
  # OUTBOUND CAMPSITE MESSAGES:

  def campsite_request_reservation_message(campsite_reservation)
    message = "New Reservation by: #{campsite_reservation.user.first_name.capitalize}
    In: #{campsite_reservation.check_in} / Out: #{campsite_reservation.check_out}
    for #{campsite_reservation.number_guests}, Total: R$#{campsite_reservation.total_price}.
    Description: #{campsite_reservation.description} Respond Yes/No to accept or decline. "
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  def campsite_cancel_reservation_message(campsite_reservation)
    message = " #{campsite_reservation.user.first_name.capitalize} has cancelled their reservation
    In: #{campsite_reservation.check_in} / Out: #{campsite_reservation.check_out}
    for #{campsite_reservation.number_guests}, Total: R$#{campsite_reservation.total_price}.
      Description: #{campsite_reservation.description}"
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  # OUTBOUND BOAT MESSAGES:
  def boat_request_reservation_message(journey_reservation)
    message = "New Reservation by: #{journey_reservation.user.first_name.capitalize}
    Departure: #{journey_reservation.departure_time}
    for #{journey_reservation.number_passengers}, Total: R$#{journey_reservation.total_price}.
    Respond Yes/No to accept or decline. "
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  def boat_cancel_reservation_message(journey_reservation)
    message = "#{journey_reservation.user.first_name.capitalize} has cancelled their reservation
    Departure: #{journey_reservation.departure_time}
    for #{journey_reservation.number_passengers}, Total: R$#{journey_reservation.total_price}."
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

end
