# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tea do
    category do
      Faker::Lorem.words
    end

    sequence :factory do |n|
      "factory #{n}"
    end

    name do
      Faker::Lorem.words
    end

    user_id do
      u = create :user
      u.id
    end
  end
end
