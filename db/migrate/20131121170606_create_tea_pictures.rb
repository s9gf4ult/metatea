class CreateTeaPictures < ActiveRecord::Migration
  def change
    create_table :tea_pictures do |t|
      t.integer :tea_id

      t.timestamps
    end
  end
end
