require "rails_helper"

RSpec.describe "add a hotel review", type: :request do
    it "can add a review" do
      joe = Author.create(name: "Joe")
      jill = Author.create(name: "Jill")

      hotel_review = HotelReview.create(review: "I'm so happy", author: joe)
      restaurant_review = RestaurantReview.create(review: 1, author: jill)

      headers = { "X-Api-key" => Rails.application.credentials.api_secret }
      query = <<~GRAPHQL
      query {
        allReviews {
          ...on HotelReview {
            description: review
            author {
              name
            }
          }

          ...on RestaurantReview {
            stars: review
            author {
              name
            }
          }
        }
      }
      GRAPHQL

      params = {
        "query" => query,
        "variables" => nil
      }

      post "/graphql", params: params, headers: headers

      reviews = JSON.parse(response.body).dig("data", "allReviews")
      expect(reviews).to match_array(
        [
          {
            "description"=> hotel_review.review,
            "author"=>{"name"=> joe.name}
          },
          {
            "stars"=> restaurant_review.review,
            "author"=>{"name"=>jill.name }
          }
        ]
      )
    end
end
