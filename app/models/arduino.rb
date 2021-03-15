class Arduino < ApplicationRecord
  has_many :sensors, dependent: :destroy
  accepts_nested_attributes_for :sensors
end
