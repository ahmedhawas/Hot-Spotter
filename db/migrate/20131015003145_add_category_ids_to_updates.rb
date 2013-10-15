class AddCategoryIdsToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :category_ids, :integer
  end
end
