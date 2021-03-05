class PassengerFlightsController < ApplicationController
  before_action :set_flight, only: [:destroy]
  before_action :set_passenger, only: [:destroy]

  def destroy
    @passenger_flight = PassengerFlight.find_by(
      flight_id: @flight.id,
      passenger_id: @passenger.id
    )
    @passenger_flight.destroy
    flash[:notice] = "#{@passenger.name} Removed from Flight"
    redirect_to flight_path(@flight)
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def set_passenger
    @passenger = Passenger.find(params[:format])
  end
end
