class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :room_id, :comment, :check_in_on, :check_out_on
end
