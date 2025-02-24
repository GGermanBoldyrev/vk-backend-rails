FactoryBot.define do
  factory :classroom do
    number { Faker::Number.between(from: 1, to: 12) }
    letter { Faker::Alphanumeric.alpha(number: 1).upcase }
    school
  end
end
