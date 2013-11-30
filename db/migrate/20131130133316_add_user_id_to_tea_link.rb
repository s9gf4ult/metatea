class AddUserIdToTeaLink < ActiveRecord::Migration
  def change
    add_column :tea_links, :user_id, :integer
  end
end
