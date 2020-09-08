module Types
  class MutationType < Types::BaseObject
    field :add_hotel_review, mutation: Mutations::AddHotelReview
  end
end
