class Types::ReviewType < Types::BaseUnion
  description "Objects that have a review"
  possible_types Types::HotelReviewType, Types::RestaurantReviewType

  def self.resolve_type(object, context)
    if object.is_a?(HotelReview)
      Types::HotelReviewType
    else object.is_a?(RestaurantReview)
      Types::RestaurantReviewType
    end
  end
end
