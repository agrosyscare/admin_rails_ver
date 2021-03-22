class TemperatureReadingSerializer < ActiveModel::Serializer
  attributes :id, :reading, :status
end
