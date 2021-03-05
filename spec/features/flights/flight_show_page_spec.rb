require "rails_helper"

RSpec.describe "When I visit a flights show page" do
  before :each do
    @flight = Flight.create!(
      number: "1737",
      date: "10/20/20",
      time: "10:00 AM",
      departure_city: "Tampa",
      arrival_city: "Las Vegas"
    )
    @passenger1 = @flight.passengers.create(
      name: "Jake The Dog",
      age: 900
    )
    @passenger2 = @flight.passengers.create(
      name: "Fin",
      age: 14
    )
    @passenger3 = @flight.passengers.create(
      name: "Ice King",
      age: 70
    )
    @passenger4 = @flight.passengers.create(
      name: "Lemondrop guy",
      age: 45
    )
  end

  describe "I see the flights number, date, time, departure and arrival city" do
    it "Shows attributes" do
      visit flight_path(@flight)

      expect(page).to have_content(@flight.number)
      expect(page).to have_content(@flight.date)
      expect(page).to have_content(@flight.time)
      expect(page).to have_content(@flight.departure_city)
      expect(page).to have_content(@flight.arrival_city)
    end

    it "Shows names of all adult passengers on flight" do
      visit flight_path(@flight)
      # save_and_open_page

      within(".passengers") do
        expect(page).to have_content(@passenger1.name)
        expect(page).not_to have_content(@passenger2.name)
        expect(page).to have_content(@passenger3.name)
        expect(page).to have_content(@passenger4.name)
      end
    end

    it "Shows average age of all ~adult~ passengers on the flight (greater than or equal to 18)" do
      visit flight_path(@flight)

      expect(page).to have_content("Average Age of Adult Passengers: 338")
    end
  end
end
