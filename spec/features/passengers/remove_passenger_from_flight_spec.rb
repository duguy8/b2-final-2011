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

  describe "Theres a button to remove each adult passenger from the flight" do
    it "I see a button next to each passenger" do
      visit flight_path(@flight)

      within("#passenger-#{@passenger1.id}") do
        expect(page).to have_button("Remove Passenger")
      end

      within("#passenger-#{@passenger3.id}") do
        expect(page).to have_button("Remove Passenger")
      end

      within("#passenger-#{@passenger4.id}") do
        expect(page).to have_button("Remove Passenger")
      end
    end

    it "Redirects me to the flights show page" do
      visit flight_path(@flight)

      within("#passenger-#{@passenger1.id}") do
        click_button("Remove Passenger")
      end

      expect(current_path).to eq(flight_path(@flight))
    end

    it "No longer shows the passenger" do
      visit flight_path(@flight)

      within("#passenger-#{@passenger1.id}") do
        click_button("Remove Passenger")
      end

      visit flight_path(@flight)

      expect(page).not_to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).not_to have_content(@passenger1.name)
    end

    it "Shows flash message that passenger was removed" do
      visit flight_path(@flight)

      within("#passenger-#{@passenger1.id}") do
        click_button("Remove Passenger")
      end

      expect(page).to have_content("#{@passenger1.name} Removed from Flight")
    end
  end
end
