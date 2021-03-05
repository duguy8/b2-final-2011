require "rails_helper"

RSpec.describe "When I visit the flight index page" do
  before :each do
    @flight1 = Flight.create!(
      number: "1737",
      date: "10/20/20",
      time: "10:00 AM",
      departure_city: "Tampa",
      arrival_city: "Las Vegas"
    )
    @passenger1 = @flight1.passengers.create(
      name: "Jake The Dog",
      age: 900
    )
    @passenger2 = @flight1.passengers.create(
      name: "Fin",
      age: 14
    )
    @flight2 = Flight.create!(
      number: "2345",
      date: "01/02/21",
      time: "10:00 AM",
      departure_city: "Miami",
      arrival_city: "London"
    )
    @passenger3 = @flight2.passengers.create(
      name: "Jake The Dog",
      age: 900
    )
    @passenger4 = @flight2.passengers.create(
      name: "Fin",
      age: 14
    )
    @passenger5 = @flight2.passengers.create(
      name: "Ice King",
      age: 70
    )
    @flight3 = Flight.create!(
      number: "1012",
      date: "05/10/20",
      time: "10:00 AM",
      departure_city: "Denver",
      arrival_city: "Reno"
    )
    @passenger6 = @flight3.passengers.create(
      name: "Jake The Dog",
      age: 900
    )
    @passenger7 = @flight3.passengers.create(
      name: "Fin",
      age: 14
    )
    @passenger8 = @flight3.passengers.create(
      name: "Ice King",
      age: 70
    )
    @passenger9 = @flight3.passengers.create(
      name: "Lemondrop guy",
      age: 45
    )
    @flight4 = Flight.create!(
      number: "1111",
      date: "05/10/19",
      time: "2:00 AM",
      departure_city: "Tokyo",
      arrival_city: "New York"
    )
    @passenger10 = @flight4.passengers.create(
      name: "Jake The Dog",
      age: 900
    )
    @passenger11 = @flight4.passengers.create(
      name: "Fin",
      age: 14
    )
    @passenger12 = @flight4.passengers.create(
      name: "Ice King",
      age: 70
    )
    @passenger13 = @flight4.passengers.create(
      name: "Lemondrop guy",
      age: 45
    )
    @passenger14 = @flight4.passengers.create(
      name: "Lemondrop guy",
      age: 45
    )
  end

  describe "The flights are ordered" do
    it "By the number of passengers on the flight, most to least" do
      visit flights_path

      expect(@flight4.number).to appear_before(@flight2.number)
      expect(@flight4.number).to appear_before(@flight3.number)
      expect(@flight3.number).to appear_before(@flight2.number)
      expect(@flight2.number).to appear_before(@flight1.number)
      expect(@flight3.number).to appear_before(@flight1.number)
    end
  end
end
