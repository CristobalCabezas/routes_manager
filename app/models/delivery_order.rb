class DeliveryOrder < ApplicationRecord
  validates :code, presence: true
  validates :weight_kg, presence: true
  validates :destination_address, presence: true
  validates :status, presence: true
  validates :scheduled_date, presence: true
  enum :status, { pending: 0, assigned: 1, delivered: 2, failed: 3 }
end
