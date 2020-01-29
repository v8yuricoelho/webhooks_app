FactoryBot.define do
    factory :event do
        association :issue
        action {Faker::Verb.past}
    end
  end