module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    field :hotel_reviews, [Types::HotelReviewType], null: false

    def authors
      Author.all
    end

    def hotel_reviews
      HotelReview.all
    end
  end
end
