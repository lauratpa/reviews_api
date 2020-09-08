module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end
  end
end
