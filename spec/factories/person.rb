FactoryGirl.define do

  factory :person do
    association :city
    identification_type 0
    identification { Faker::Number.number(10) }
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
  end

end