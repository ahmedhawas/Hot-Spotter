class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :update_type
      t.integer :update_id

      t.timestamps
    end
  end
end
