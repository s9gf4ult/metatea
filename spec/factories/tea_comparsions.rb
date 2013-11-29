# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tea_comparsion do
    axis_name do
      SETTINGS[:axis][:names].sample
    end

    left_tea_id do
      tea = create :tea
      tea.id
    end

    result { [0, SETTINGS[:axis][:grade][0]].sample }

    right_tea_id do
      tea = create :tea
      tea.id
    end

    user_id do
      u = create :user
      u.id
    end
  end
end
