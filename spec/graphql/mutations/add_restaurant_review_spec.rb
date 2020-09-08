require "rails_helper"

RSpec.describe Mutations::AddRestaurantReview do
  context "when given valid params" do
    it "creates a review" do
      joe = Author.create!(name: "Joe")
      content = 3

      review = Mutations::AddRestaurantReview
        .new(object: nil, field: nil, context: {})
        .resolve({author: joe.name, review: content})

      expect(review).to be_an_instance_of(RestaurantReview)
      expect(review.author).to eq(joe)
      expect(review.review).to eq(content)
    end
  end

  context "when given invalid params" do
    it "creates a review" do
      joe = Author.create!(name: "Joe")
      review = 100

      error = Mutations::AddRestaurantReview
        .new(object: nil, field: nil, context: {})
        .resolve({author: joe.name, review: review})

      expect(error).to be_a(GraphQL::ExecutionError)
      expect(error.message).to eq(
        "Invalid attributes for RestaurantReview: Review is not included in the list"
      )
    end
  end
end
