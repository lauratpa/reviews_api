require "rails_helper"

RSpec.describe "authentification", type: :request do
  context "when the correct api key is given" do
    it "succeeds" do
      headers = { "X-Api-key" => Rails.application.credentials.api_secret }
      params = {
        "query" => "query {\n  authors {\n    id\n    name\n  }\n}",
        "variables" => nil
      }

      post "/graphql", params: params, headers: headers

      expect(JSON.parse(response.body).keys).to contain_exactly("data")
    end
  end

  context "when an incorrect api key is given" do
    it "fails" do
      headers = { "X-Api-key" => "wrong" }
      params = {
        "query" => "query {\n  authors {\n    id\n    name\n  }\n}",
        "variables" => nil
      }

      post "/graphql", params: params, headers: headers

      expect(response.body).to be_empty
      expect(response.status).to eq(401)
    end
  end
end
