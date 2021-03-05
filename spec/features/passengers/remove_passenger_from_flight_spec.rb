require "rails_helper"

RSpec.describe "As a visitor on a flights show page" do
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

  describe "Theres a button to remove each passenger from the flight" do
    it "I see a button next to each passenger" do
      visit flight_path(@flight)

      within("#passenger-#{@passenger1.id}") do
        expect(page).to have_button("Remove Passenger")
      end

      within("#passenger-#{@passenger2.id}") do
        expect(page).to have_button("Remove Passenger")
      end

      within("#passenger-#{@passenger3.id}") do
        expect(page).to have_button("Remove Passenger")
      end

      within("#passenger-#{@passenger4.id}") do
        expect(page).to have_button("Remove Passenger")
      end
    end
    
    it "Redirects me to the flights show page"
    it "No longer shows the passenger"
    it "Shows flash message that passenger was removed"
  end
end


# User Story 3, Remove a Passenger from a Flight
# ​
# As a visitor
# When I visit a flight's show page
# Next to each passengers name I see a link or button to remove that passenger from that flight
# When I click on that link or button
# I'm returned to the flight's show page
# And I no longer see that passenger listed
