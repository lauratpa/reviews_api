module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    field :hotel_reviews, [Types::HotelReviewType], null: false
    field :restaurant_reviews, [Types::RestaurantReviewType], null: false
    field :all_reviews, [Types::ReviewType], null: false

    def authors
      Author.all
    end

    def hotel_reviews
      HotelReview.all
    end

    def restaurant_reviews
      RestaurantReview.all
    end

    def all_reviews
      hotel_reviews + restaurant_reviews
    end
  end
end
