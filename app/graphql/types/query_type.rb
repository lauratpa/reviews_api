module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    field :hotel_reviews, [Types::HotelReviewType], null: false
    field :restaurant_reviews, [Types::RestaurantReviewType], null: false

    def authors
      Author.all
    end

    def hotel_reviews
      HotelReview.all
    end

    def restaurant_reviews
      RestaurantReview.all
    end
  end
end
