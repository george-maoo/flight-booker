class BookingsController < ApplicationController
  def new
    @flight = Flight.find(bookings_params[:flight_id])
    @passengers = Array.new(bookings_params[:num_tickets].to_i) do
      Passenger.new
    end
  end

  def create
  end

  private

  def bookings_params
    params.permit(:flight_id, :num_tickets)
  end
end
