module Types
  class MutationType < Types::BaseObject
    field :add_hotel_review, mutation: Mutations::AddHotelReview
    field :add_restaurant_review, mutation: Mutations::AddRestaurantReview
  end
end
