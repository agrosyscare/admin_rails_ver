class EnvironmentalSetting < ApplicationRecord
  belongs_to :floor

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
end
