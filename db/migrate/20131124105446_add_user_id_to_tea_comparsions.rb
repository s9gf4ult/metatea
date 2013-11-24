class AddUserIdToTeaComparsions < ActiveRecord::Migration
  def change
    add_column :tea_comparsions, :user_id, :integer
  end
end
