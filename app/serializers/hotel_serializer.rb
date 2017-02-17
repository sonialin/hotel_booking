class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number
end
