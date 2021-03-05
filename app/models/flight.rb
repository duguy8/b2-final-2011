class Flight < ApplicationRecord
  validates :number, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights
  scope :alphabetical_order, -> { order(:departure_city) }
end
