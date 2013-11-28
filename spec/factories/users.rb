# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email do
      Faker::Internet.email
    end
    password do
      Faker::Internet.password
    end
    remember_me false
  end
end
