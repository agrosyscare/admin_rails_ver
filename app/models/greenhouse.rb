class Greenhouse < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { minimum: 10 }

end
