class CreateCategoriesUpdatesJoinTable < ActiveRecord::Migration
  def change
  		create_table :categories_updates do |t|
	 	t.integer "category_id"
	 	t.integer "update_id"
	 end
  end
end
