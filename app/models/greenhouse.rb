class Greenhouse < ApplicationRecord
  has_paper_trail only: %i[ name description ]
  has_many :floors

  validates :name, presence: true
  validates :description, length: { minimum: 10, maximum: 200 }
end
