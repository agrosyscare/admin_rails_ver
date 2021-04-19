class Sensor < ApplicationRecord
  belongs_to :environmental_condition
  belongs_to :arduino
  belongs_to :floor

  has_many :temperature_readings
end
