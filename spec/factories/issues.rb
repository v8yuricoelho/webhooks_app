FactoryBot.define do
    factory :issue do
        number {Faker::Number.within(range: 1..100)}
    end
end