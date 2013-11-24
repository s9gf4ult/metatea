class CreateTeaComparsions < ActiveRecord::Migration
  def change
    create_table :tea_comparsions do |t|
      t.integer :left_tea_id
      t.integer :right_tea_id
      t.string :axis_name
      t.integer :result

      t.timestamps
    end
  end
end
