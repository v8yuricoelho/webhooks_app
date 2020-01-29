require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      subject = build(:issue)
      expect(subject).to be_valid
    end

    it "is not valid without a number" do
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many events" do
      subject = Issue.reflect_on_association(:events)
      expect(subject.macro).to eq :has_many
    end
  end
end
