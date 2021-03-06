require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "Validations" do
    it { should validate_presence_of :number }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :departure_city }
    it { should validate_presence_of :arrival_city }
  end

  describe "Relationships" do
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through(:passenger_flights) }
  end

  describe "Class Methods" do
    it "#alphabetical_order" do
      flight1 = Flight.create!(
        number: "1737",
        date: "10/20/20",
        time: "10:00 AM",
        departure_city: "Tampa",
        arrival_city: "Las Vegas"
      )
      passenger1 = flight1.passengers.create(
        name: "Jake The Dog",
        age: 900
      )
      flight2 = Flight.create!(
        number: "2345",
        date: "01/02/21",
        time: "11:00 AM",
        departure_city: "Miami",
        arrival_city: "London"
      )
      passenger2 = flight2.passengers.create(
        name: "Jake The Dog",
        age: 900
      )
      flight3 = Flight.create!(
        number: "1012",
        date: "05/10/20",
        time: "3:00 PM",
        departure_city: "Denver",
        arrival_city: "Reno"
      )
      passenger3 = flight3.passengers.create(
        name: "Jake The Dog",
        age: 900
      )
      expect(Flight.alphabetical_order_by_count.first).to eq(flight3)
      expect(Flight.alphabetical_order_by_count.second).to eq(flight2)
      expect(Flight.alphabetical_order_by_count.third).to eq(flight1)
    end
  end
end
