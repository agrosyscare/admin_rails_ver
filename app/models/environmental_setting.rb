class EnvironmentalSetting < ApplicationRecord
  belongs_to :floor
  belongs_to :environmental_condition
end
