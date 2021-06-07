class Sensor < ApplicationRecord
  belongs_to :environmental_condition
  belongs_to :arduino
  belongs_to :floor

  has_many :temperature_readings
  has_many :humidity_readings
  has_many :root_moisture_readings

  validates :model, presence: true
  validates :serial, presence: true

end
