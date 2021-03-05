require "rails_helper"

RSpec.describe "When I visit the flights index page" do
  before :each do
    @flight1 = Flight.create!(
      number: "1737",
      date: "10/20/20",
      departure_city: "Tampa",
      arrival_city: "Las Vegas"
    )

    @flight2 = Flight.create!(
      number: "2345",
      date: "01/02/21",
      departure_city: "Miami",
      arrival_city: "London"
    )

    @flight3 = Flight.create!(
      number: "1012",
      date: "05/10/20",
      departure_city: "Denver",
      arrival_city: "Reno"
    )
  end

  describe "I see each flight in the system" do
    it "I see their number, departure & arrival city" do
      visit flights_path

      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
      expect(page).to have_content(@flight1.departure_city)
      expect(page).to have_content(@flight2.departure_city)
      expect(page).to have_content(@flight3.departure_city)
      expect(page).to have_content(@flight1.arrival_city)
      expect(page).to have_content(@flight2.arrival_city)
      expect(page).to have_content(@flight3.arrival_city)
    end

    it "I see they are listed in alphabetical order by departure city" do
      visit flights_path

      expect(@flight3.departure_city).to appear_before(@flight2.departure_city)
      expect(@flight2.departure_city).to appear_before(@flight1.departure_city)
      expect(@flight3.departure_city).to appear_before(@flight1.departure_city)
    end
  end
end
