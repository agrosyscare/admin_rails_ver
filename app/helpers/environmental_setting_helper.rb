module EnvironmentalSettingHelper
  def average_temperature(greenhouse_id, tab)
    avg = []
    floors = set_floor(greenhouse_id)

    floors.each do |floor|
      if tab == 1
        data = floor.temperature_readings.group_by_day(:created_at, last: 7).average(:reading)
      elsif tab == 2
        data = floor.humidity_readings.group_by_day(:created_at, last: 7).average(:reading)
      else
        data = floor.root_moisture_readings.group_by_day(:created_at, last: 7).average(:reading)
      end
      new_data = data.values.reject{|a| a.nil?}
      avg << new_data.inject{ |sum, el| sum + el }.to_f / new_data.size
    end

    new_avg = avg.reject{|a| a.nan?}
    return new_avg.inject{ |sum, el| sum + el }.to_f / new_avg.size
  end

  def minimum_temperature(greenhouse_id, tab)
    min = []
    floors = set_floor(greenhouse_id)

    floors.each do |floor|
      if tab == 1
        data = floor.temperature_readings.group_by_day(:created_at, last: 7).minimum(:reading)
      elsif tab == 2
        data = floor.humidity_readings.group_by_day(:created_at, last: 7).minimum(:reading)
      else
        data = floor.root_moisture_readings.group_by_day(:created_at, last: 7).minimum(:reading)
      end
      new_data = data.values.reject{|a| a.nil?}
      min << new_data.min
    end

    return min.reject{|a| a.nil?}.min
  end

  def maximum_temperature(greenhouse_id, tab)
    max = []
    floors = set_floor(greenhouse_id)

    floors.each do |floor|
      if tab == 1
        data = floor.temperature_readings.group_by_day(:created_at, last: 7).maximum(:reading)
      elsif tab == 2
        data = floor.humidity_readings.group_by_day(:created_at, last: 7).maximum(:reading)
      else
        data = floor.root_moisture_readings.group_by_day(:created_at, last: 7).maximum(:reading)
      end
      new_data = data.values.reject{|a| a.nil?}
      max << new_data.max
    end

    return max.reject{|a| a.nil?}.max
  end

  private

  def set_floor(id)
    Floor.where(greenhouse_id: id)
  end
end
