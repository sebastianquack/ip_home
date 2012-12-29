class AddAttachmentForMediaItem < ActiveRecord::Migration
  def self.up
    change_table :media_items do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :media_items, :attachment
  end
end
