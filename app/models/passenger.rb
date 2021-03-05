class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights
  scope :adult_average_age, -> {
  where('age >= ?', 18).average(:age) }
  scope :all_adults, -> {
  where('age >= ?', 18) }
end
