require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      subject = build(:event)
      expect(subject).to be_valid
    end

    it "is not valid without an action" do
      subject = build(:event, action: nil)
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to issue" do
      subject = Event.reflect_on_association(:issue)
      expect(subject.macro).to eq :belongs_to
    end
  end
end