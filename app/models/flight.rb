class Flight < ApplicationRecord
  validates :number, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def self.alphabetical_order
    joins(:passengers)
    .select('flights.*, count(passengers.*) AS passenger_count')
    .group('flights.id')
    .order('passenger_count DESC, departure_city ASC')
  end
end
