class Floor < ApplicationRecord
  belongs_to :greenhouse

  has_many :sensors
  has_many :environmental_settings
  has_many :temperature_readings, through: :sensors
end
