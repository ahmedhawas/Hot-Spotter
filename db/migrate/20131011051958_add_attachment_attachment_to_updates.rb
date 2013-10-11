class AddAttachmentAttachmentToUpdates < ActiveRecord::Migration
  def self.up
    change_table :updates do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :updates, :attachment
  end
end
