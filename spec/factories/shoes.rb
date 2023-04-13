FactoryBot.define do
    factory :shoe do
        name { Faker::Company.name }
    end
end