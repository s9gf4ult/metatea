class AddDescriptionToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :description, :text
  end
end
