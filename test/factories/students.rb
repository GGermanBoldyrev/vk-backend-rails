FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    surname { Faker::Name.last_name }
    classroom
    school
  end
end
