class FlightsController < ApplicationController
  def index
    @flights = Flight.alphabetical_order
  end
end
