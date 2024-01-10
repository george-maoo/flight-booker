class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)

    num_tickets = params[:num_tickets].to_i
    num_tickets = 4 if num_tickets > 4
    num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(bookings_params)

    if @booking.save
      flash[:notice] = "Successfully booked flight"
      redirect_to booking_path(@booking.id)
    else
      flash[:alert] = "An error occured"
      redirect_to new_booking_path, status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
  end
end
