class Greenhouse < ApplicationRecord
  include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_many :floors

  validates :name, presence: true
  validates :description, length: { minimum: 10, maximum: 200 }
end
