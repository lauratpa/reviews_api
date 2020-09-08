module Types
  class HotelReviewType < Types::BaseObject
    field :id, ID, null: false
    field :review, String, null: false
    field :author, Types::AuthorType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
