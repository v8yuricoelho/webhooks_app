require 'rails_helper'

RSpec.describe "Events", type: :request do
  let!(:subject) {build(:event)}

  describe "GET #index" do
    it "should respond with 200" do
      get issue_events_path(subject.issue.number)
      expect(response).to have_http_status(200)
    end
  end
end
