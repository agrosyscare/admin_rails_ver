class EnvironmentalCondition < ApplicationRecord
  has_many :sensors
  has_many :environmental_settings

  validates :name, presence: true
  validates :plant_type, presence: true

end
