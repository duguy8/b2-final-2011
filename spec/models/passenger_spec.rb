require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "Relationships" do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe "Class Methods" do
    it "#adult_average_age" do
      flight = Flight.create!(
        number: "1737",
        date: "10/20/20",
        time: "10:00 AM",
        departure_city: "Tampa",
        arrival_city: "Las Vegas"
      )
      passenger1 = flight.passengers.create(
        name: "Jake The Dog",
        age: 900
      )
      passenger2 = flight.passengers.create(
        name: "Fin",
        age: 14
      )
      passenger3 = flight.passengers.create(
        name: "Ice King",
        age: 70
      )
      passenger4 = flight.passengers.create(
        name: "Lemondrop guy",
        age: 45
      )

      expect(Passenger.adult_average_age.round).to eq(338)
    end
  end
end
