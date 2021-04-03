class ReadingForm
  def self.transform(options = {})
    attributes = {}

    attributes[:reading] = options[:reading] if options[:reading].present?
    if options[:reading].present? && options[:sensor_id].present?
      attributes[:status] = define_status(options[:reading], options[:sensor_id])
    end
    attributes[:sensor_id] = options[:sensor_id] if options[:sensor_id].present?

    attributes
  end

  def self.obtain_min_value(id)
    setting = EnvironmentalSetting.find_by(floor_id: Sensor.find_by(id: id).floor_id).config
    setting["min_value_#{Sensor.find_by(id: id).environmental_condition_id}"]
  end

  def self.obtain_max_value(id)
    setting = EnvironmentalSetting.find_by(floor_id: Sensor.find_by(id: id).floor_id).config
    setting["max_value_#{Sensor.find_by(id: id).environmental_condition_id}"]
  end

  def self.define_status(value, id)
    if value.to_i < obtain_min_value(id).to_i
      'Bajo'
    elsif value.to_i > obtain_max_value(id).to_i
      'Alto'
    else
      'Normal'
    end
  end
end
