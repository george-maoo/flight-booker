class BookingsController < ApplicationController
  def new
    @flight = Flight.find(bookings_params[:flight_id])
    @booking = Booking.new(flight: @flight)

    num_tickets = bookings_params[:num_tickets].to_i
    num_tickets = 4 if num_tickets > 4
    num_tickets.times { @booking.passengers.build }
  end

  def create
    puts "PARAMETERS: #{params}"
    puts "#{params[:booking]}"
  end

  private

  def bookings_params
    params.permit(:flight_id, :num_tickets)
  end
end
