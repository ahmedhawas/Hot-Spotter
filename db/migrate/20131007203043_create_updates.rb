class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :comment

      t.timestamps
    end
  end
end
