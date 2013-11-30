# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # include ActionDispatch::TestProcess
  factory :tea_picture do
    tea_id do
      tea = create :tea
      tea.id
    end

    picture do
      fixture_file_upload File::join(Rails.root, 'spec', "factories", "pictures", "tea.jpg"), 'image/jpg'
    end

    user_id do
      user = create :user
      user.id
    end
    # picture_file_name File::join(Rails.root, 'spec', "factories", "pictures", "tea.jpg")
    # picture_content_type 'image/jpg'
  end
end
