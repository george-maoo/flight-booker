class PassengerMailer < ApplicationMailer
  def confirmation_email(passenger)
    @passenger = passenger
    @flight = @passenger.flight
    @booking = @flight.bookings.first

    mail(to: @passenger.email, subject: "Flight booker confirmation")
  end
end
