class AddCollectionDateToTeas < ActiveRecord::Migration
  def change
    add_column :teas, :collection_date, :date
  end
end
