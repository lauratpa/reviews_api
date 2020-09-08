require "rails_helper"

RSpec.describe "add a hotel review", type: :request do
    it "can add a review" do
      author = Author.create(name: "Joe")
      content = "I didn't like the paintings"

      headers = { "X-Api-key" => Rails.application.credentials.api_secret }
      mutation = <<~GRAPHQL
        mutation {
          addHotelReview(
            input: {
              review: "#{content}",
              author: "#{author.name}"
            }
          ) {
            id
            review
            author {
              name
            }
          }
        }
      GRAPHQL

      params = {
        "query" => mutation,
        "variables" => nil
      }

      expect { post "/graphql", params: params, headers: headers }
        .to change { HotelReview.count }
        .by(1)

      review = JSON.parse(response.body).dig("data", "addHotelReview")
      expect(review["review"]).to eq(content)
      expect(review["author"]["name"]).to eq(author.name)
    end
end
