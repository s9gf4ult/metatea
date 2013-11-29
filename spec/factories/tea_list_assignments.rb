# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tea_list_assignment do
    list_name do
      SETTINGS[:user][:lists].sample
    end

    tea_id do
      tea = create :tea
      tea.id
    end

    user_id do
      user = create :user
      user.id
    end
  end
end
