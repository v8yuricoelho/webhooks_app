require 'rails_helper'

RSpec.describe "Issues", type: :request do
  let!(:subject) { build(:issue) }

  describe "GET #show" do
    it "should respond with 200" do
      get issue_path(subject.number)
      expect(response).to have_http_status(200)
    end
  end
end
