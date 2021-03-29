class EnvironmentalSettingsController < ApplicationController
  def index
    @environmental_conditions = EnvironmentalCondition.all
    @environmental_settings = EnvironmentalSetting.new
  end

  private

  def environmental_setting_params
    params.require(:environmental_setting).permit(:min_value, :max_value, :floor_id, :environmental_condition_id)
  end
end
