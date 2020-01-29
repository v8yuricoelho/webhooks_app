FactoryBot.define do
    factory :event do
        association :issue
        action {Faker::Verb.past}
    end

    factory :unassociated_event, class: "Event" do
        action {Faker::Verb.past}
    end

    factory :event_without_action, class: "Event" do
        association :issue
        action {}
    end
  end