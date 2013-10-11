class AddLatAndLongToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :lat, :float
    add_column :updates, :long, :float
  end
end
