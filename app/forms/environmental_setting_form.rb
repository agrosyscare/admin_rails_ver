class EnvironmentalSettingForm
  def self.transform(options = {})
    attributes = {}
    attributes[:floor_id] = options[:environmental_setting][:floor_id]

    EnvironmentalCondition.all.each do |condition|
      attributes[:config] ||= {}
      attributes[:config]["min_value_#{condition.id}"] = options["environmental_setting"]["min_value_#{condition.id}"]
      attributes[:config]["max_value_#{condition.id}"] = options["environmental_setting"]["max_value_#{condition.id}"]
    end

    attributes
  end
end
