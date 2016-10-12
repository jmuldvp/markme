FactoryGirl.define do
  factory :topic do
    title Faker::Company.buzzword
    # user nil
  end
end
