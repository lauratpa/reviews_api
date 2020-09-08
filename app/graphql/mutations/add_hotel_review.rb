module Mutations
  class AddHotelReview < Mutations::BaseMutation
    # I'm fairly confident that there is a way to add the min 10 chars requirement here as well
    argument :review, String, required: true
    argument :author, String, required: true

    type Types::HotelReviewType

    def resolve(params)
      author = Author.find_by!(name: params[:author])
      review = HotelReview.create!(review: params[:review], author: author)

      review
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(", ")}"
      )
    end
  end
end
