class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all

    @searched_flights = Flight.all.order(:date)
    @searched_flights = @searched_flights.during_date(flight_search_params[:date]) unless flight_search_params[:date] == ""
    @searched_flights = @searched_flights.from_airport(flight_search_params[:departure_code]) unless flight_search_params[:departure_code] == ""
    @searched_flights = @searched_flights.to_airport(flight_search_params[:arrival_code]) unless flight_search_params[:arrival_code] == ""
  end

  def flight_search_params
    params.permit(:departure_code, :arrival_code, :date, :num_tickets)
  end
end
