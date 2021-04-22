class EnvironmentalSettingsController < ApplicationController
  before_action :set_settings
  before_action :set_environmental_conditions

  def index
  end

  def update
    respond_to do |format|
      if @environmental_setting.update(EnvironmentalSettingForm.transform(environmental_setting_params))
        format.html { redirect_to floors_path }
      else
        format.html { render :index }
      end
    end
  end

  private

  def environmental_setting_params
    params.permit(
      environmental_setting: [
        :floor_id,
        EnvironmentalCondition.pluck(:id).collect { |i| "min_value_#{i}" },
        EnvironmentalCondition.pluck(:id).collect { |i| "max_value_#{i}" }
      ]
    )
  end

  def set_settings
    @environmental_setting = EnvironmentalSetting.find_or_create_by(floor_id: params[:floor_id])
  end

  def set_environmental_conditions
    @environmental_conditions = EnvironmentalCondition.all
  end
end
