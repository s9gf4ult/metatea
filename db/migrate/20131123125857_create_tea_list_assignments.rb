class CreateTeaListAssignments < ActiveRecord::Migration
  def change
    create_table :tea_list_assignments do |t|
      t.integer :user_id
      t.integer :tea_id
      t.string :list_name

      t.timestamps
    end
  end
end
