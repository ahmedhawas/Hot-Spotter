class RenameDatabaseColumn < ActiveRecord::Migration
  def change
  	rename_column :updates, :category_id, :category_ids
  end
end
