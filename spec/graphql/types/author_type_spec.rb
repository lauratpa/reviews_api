require "rails_helper"

RSpec.describe Types::QueryType do
  describe "authors" do
    let(:query) do
      %(query {
        authors {
          id
          name
        }
      })
    end

    it "returns all items" do
      authors = [
        Author.create!(name: "Joe"),
        Author.create!(name: "Jill")
      ]
      result = ReviewsApiSchema.execute(query).as_json

      expect(result.dig("data", "authors")).to match_array(
        authors.map { |author| { "id" => author.id.to_s, "name" => author.name } }
      )
    end
  end
end
