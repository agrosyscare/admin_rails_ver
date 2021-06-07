class EnvironmentalCondition < ApplicationRecord
  has_many :sensors
  has_many :environmental_settings

  validates :name, presence: true

end
