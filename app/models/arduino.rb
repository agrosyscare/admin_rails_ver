class Arduino < ApplicationRecord
  has_many :sensors, dependent: :destroy
  accepts_nested_attributes_for :sensors

  validates :model, presence: true
  validates :serial, presence: true

end
