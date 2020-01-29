require "rails_helper"

RSpec.describe EventsController, type: :routing do
    it "routes to #index" do
      expect(get: "/issues/:issue_number/events").to route_to("events#index", "issue_number": ":issue_number")
    end

    it "routes to #post" do
      expect(post: "/events").to route_to("events#create")
    end
end