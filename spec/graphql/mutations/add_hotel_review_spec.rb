require "rails_helper"

RSpec.describe Mutations::AddHotelReview do
  context "when given valid params" do
    it "creates a review" do
      joe = Author.create!(name: "Joe")
      content = "Excellent service!"

      review = Mutations::AddHotelReview
        .new(object: nil, field: nil, context: {})
        .resolve({author: joe.name, review: content})

      expect(review).to be_an_instance_of(HotelReview)
      expect(review.author).to eq(joe)
      expect(review.review).to eq(content)
    end
  end

  context "when given invalid params" do
    it "creates a review" do
      joe = Author.create!(name: "Joe")
      review = "bla"

      error = Mutations::AddHotelReview
        .new(object: nil, field: nil, context: {})
        .resolve({author: joe.name, review: review})

      expect(error).to be_a(GraphQL::ExecutionError)
      expect(error.message).to eq(
        "Invalid attributes for HotelReview: Review is too short (minimum is 10 characters)"
      )
    end
  end
end
