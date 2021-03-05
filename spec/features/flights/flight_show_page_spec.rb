require "rails_helper"

RSpec.describe "When I visit a flights show page" do
  before :each do
    @flight = Flight.create!(
      number: "1737",
      date: "10/20/20",
      departure_city: "Tampa",
      arrival_city: "Las Vegas"
    )
    require "pry"; binding.pry
  end

  describe "I see the flights number, date, time, departure and arrival city" do
    it "Shows attributes" do

    end

    it "Shows names of all passengers on flight"
    it "Shows average age of all ~adult~ passengers on the flight (greater than or equal to 18)"
  end
end
