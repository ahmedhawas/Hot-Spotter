class DropCategoriesUpdatesTable < ActiveRecord::Migration
  def change
  	drop_table :categories_updates
  end
end
