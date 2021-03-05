class Flight < ApplicationRecord
  validates :number, presence: true
  validates :date, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights
end
