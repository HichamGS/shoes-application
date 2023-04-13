FactoryBot.define do
    factory :shoe_store do
        store { nil }
        shoe { nil }
        inventory { Faker::Number.number(10) }
    end
end