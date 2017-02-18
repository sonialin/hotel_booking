class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :hotel_id, :description
end
