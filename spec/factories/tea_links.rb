# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tea_link do
    link do
      Faker::Internet.url
    end

    tea_id do
      tea = FactoryGirl.create :tea
      tea.id
    end

    user_id do
      user = FactoryGirl.create :user
      user.id
    end
  end
end
