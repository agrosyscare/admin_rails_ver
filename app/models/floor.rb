class Floor < ApplicationRecord
  belongs_to :greenhouse
  has_many :environmental_settings
end
