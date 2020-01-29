require "rails_helper"

RSpec.describe IssuesController, type: :routing do
    number = Faker::Number.within(range: 1..20)

    it "routes to #show" do
        expect(get: "issues/#{number}").to route_to("issues#show", number: "#{number}") 
    end
end