class EnvironmentalSetting < ApplicationRecord
  belongs_to :floor

  validate :validates_condition_range, on: :update
  after_initialize :setup

  private

  def setup
    EnvironmentalCondition.all.each do |condition|
      define_singleton_method("min_value_#{condition.id}") do
        read_store_attribute(:config, "min_value_#{condition.id}")
      end

      define_singleton_method("max_value_#{condition.id}") do
        read_store_attribute(:config, "max_value_#{condition.id}")
      end
    end
  end

  def validates_condition_range
    if min_value_1 >= max_value_1 || min_value_2 >= max_value_2 || min_value_3 >= max_value_3
      errors.add(:value, I18n.t(:comparison_validation, scope: [:controllers, :errors]))
    end
  end
end
