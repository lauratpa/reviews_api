module Mutations
  class AddRestaurantReview < Mutations::BaseMutation
    argument :review, String, required: true
    argument :author, String, required: true

    type Types::RestaurantReviewType

    def resolve(params)
      author = Author.find_by!(name: params[:author])
      RestaurantReview.create!(review: params[:review], author: author)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(", ")}"
      )
    end
  end
end
