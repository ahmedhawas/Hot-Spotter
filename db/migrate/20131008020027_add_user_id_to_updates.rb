class AddUserIdToUpdates < ActiveRecord::Migration
  def change
  	change_table :updates do |t|
  		t.belongs_to :user
  	end
  end
end
