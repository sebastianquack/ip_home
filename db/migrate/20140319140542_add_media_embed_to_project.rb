class AddMediaEmbedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :main_media_embed, :text
  end
end
