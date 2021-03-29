class EnvironmentalSettingsController < ApplicationController
  def index
    @environmental_conditions = EnvironmentalCondition.all
  end
end