class CreateTeas < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.string :name
      t.string :factory
      t.string :category

      t.timestamps
    end
  end
end
