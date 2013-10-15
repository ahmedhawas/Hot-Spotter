class RemoveCategoryIdFromUpdates < ActiveRecord::Migration
  def change
    remove_column :updates, :category_id, :integer
  end
end
