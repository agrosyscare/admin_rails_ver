json.extract! sensor, :id, :model, :serial, :environmental_condition_id, :arduino_id, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
