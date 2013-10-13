class AddCategoryIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :category_id, :integer
  end
end
