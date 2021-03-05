class FlightsController < ApplicationController
  before_action :set_flights, only: [:index]
  before_action :set_flight, only: [:show]

  def index
  end

  def show
  end

  private

  def set_flights
    @flights = Flight.all
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
