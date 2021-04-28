class HumidityReading < ApplicationRecord
  belongs_to :sensor
  has_one :floor, through: :sensors

  validates :reading, presence: true, numericality: { lesser_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :sensor_id, presence: true
end
