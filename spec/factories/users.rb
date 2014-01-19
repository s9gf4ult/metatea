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
    name do
      Faker::Name.first_name
    end
  end
end
