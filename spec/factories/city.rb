FactoryGirl.define do

  factory :city do
    association :region
    name { Faker::Address.city }
  end

end