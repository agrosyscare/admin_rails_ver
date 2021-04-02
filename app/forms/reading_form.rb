class ReadingForm
  def self.transform options = {}
    attributes = {}

    attributes[:reading] = options[:reading] if options[:reading].present?
    attributes[:status] = define_status(options[:reading].to_i) if options[:reading].present?
    attributes[:sensor_id] = options[:sensor_id]

    attributes
  end

  def self.obtain_min_value
    # Buscar invernadero asociado
    # Buscar condicion asociada
    # Buscar valor correspondiente
    15.0
  end

  def self.obtain_max_value
    # Buscar invernadero asociado
    # Buscar condicion asociada
    # Buscar valor correspondiente
    30.0
  end

  def self.define_status(value)
    min_value = obtain_min_value
    max_value = obtain_max_value

    if value < min_value
      'Bajo'
    elsif value > max_value
      'Alto'
    else
      'Normal'
    end
  end
end
