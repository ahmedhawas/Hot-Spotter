class AddLikesToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :likes, :integer
  end
end
