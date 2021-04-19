class FloorSerializer < ActiveModel::Serializer
  attributes :id, :name, :plant_type, :greenhouse_id
end
