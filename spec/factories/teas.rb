# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tea do
    category "raw_puerh"        #  FIXME: create random
    factory Faker::Company.name
    name Faker::Lorem.words
    user_id do
      u = create :user
      u.id
    end
  end
end
