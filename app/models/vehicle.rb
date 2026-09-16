class Vehicle < ApplicationRecord
  validates :plate, presence: true
  validates :capacity_kg, presence: true
  validates :driver_name, presence: true
  validates :status, presence: true
  enum :status, { available: 0, in_route: 1, maintenance: 2 }
end
