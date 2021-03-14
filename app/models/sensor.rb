class Sensor < ApplicationRecord
  belongs_to :environmental_condition
  belongs_to :arduino
end
