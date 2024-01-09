class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  scope :during_date, ->(date) { where(date: date) }
  scope :from_airport, ->(departure_airport_id) { where(departure_airport: departure_airport_id) }
  scope :to_airport, ->(arrival_airport_id) { where(arrival_airport: arrival_airport_id) }
end