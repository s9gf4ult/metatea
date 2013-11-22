class CreateTeaLinks < ActiveRecord::Migration
  def change
    create_table :tea_links do |t|
      t.integer :tea_id
      t.string :link

      t.timestamps
    end
  end
end
