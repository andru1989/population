FactoryGirl.define do

  factory :region do
    name { Faker::Address.state }
  end

end