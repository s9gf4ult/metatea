class AddUserIdToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :user_id, :integer
  end
end
