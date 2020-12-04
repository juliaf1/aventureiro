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
    message = "Você tem uma nova reserva!
    Nova Reserva por: #{campsite_reservation.user.first_name.capitalize}\n
    Check-in: #{campsite_reservation.check_in.strftime('%d/%m/%y')}\n
    Check-out: #{campsite_reservation.check_out.strftime('%d/%m/%y')}\n
    Número de hóspedes: #{campsite_reservation.number_guests}\n
    Total: R$#{campsite_reservation.total_price}\n
    Mensagem: #{campsite_reservation.description}\n
    Para aceitar ou recusar a reserva: aventureiroilhagrande.herokuapp.com/local/campsite_reservations"
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  def campsite_cancel_reservation_message(campsite_reservation)
    message = "Sinto muito, alguém desistiu da viagem.
    Cancelamento de Reserva por: #{campsite_reservation.user.first_name.capitalize}\n
    Check-in: #{campsite_reservation.check_in.strftime('%d/%m/%y')}\n
    Check-out: #{campsite_reservation.check_out.strftime('%d/%m/%y')}\n
    Número de hóspedes: #{campsite_reservation.number_guests}\n
    Total: R$#{campsite_reservation.total_price}\n
    Mensagem: #{campsite_reservation.description}\n"
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  # OUTBOUND BOAT MESSAGES:
  def boat_request_reservation_message(journey_reservation)
    message = "Você tem uma nova reserva de barco!\n
    Nova Reserva por: #{journey_reservation.user.first_name.capitalize}\n
    Saída: #{journey_reservation.departure_time.strftime('%H:%M, %d/%m/%y')}\n
    Número de passageiros: #{journey_reservation.number_passengers}\n
    Total: R$#{journey_reservation.total_price}\n
    Para aceitar ou recusar a reserva: aventureiroilhagrande.herokuapp.com/local/boat_journey_reservations"
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

  def boat_cancel_reservation_message(journey_reservation)
    message = "Sinto muito, alguém desistiu da viagem.\n
    Cancelamento de Reserva por: #{journey_reservation.user.first_name.capitalize}\n
    Saída: #{journey_reservation.departure_time.strftime('%H:%M, %d/%m/%y')}\n
    Número de passageiros: #{journey_reservation.number_passengers}\n
    Total: R$#{journey_reservation.total_price}\n
    Para aceitar ou recusar a reserva: aventureiroilhagrande.herokuapp.com/local/boat_journey_reservations"
    TwilioWhatsappMessenger.new.send_whatsapp(message)
  end

end
