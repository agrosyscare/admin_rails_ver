class HumidityReadingSerializer < ActiveModel::Serializer
  attributes :id, :reading, :status
end
