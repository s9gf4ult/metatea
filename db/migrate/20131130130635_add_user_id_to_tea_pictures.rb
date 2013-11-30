class AddUserIdToTeaPictures < ActiveRecord::Migration
  def change
    add_column :tea_pictures, :user_id, :integer
  end
end
