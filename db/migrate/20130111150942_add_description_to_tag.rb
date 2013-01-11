class AddDescriptionToTag < ActiveRecord::Migration
  def up
  	add_column :tags, :description_en, :text
  	add_column :tags, :description_de, :text
  end
  
  def down
    remove_column :tags, :description_en
    remove_column :tags, :description_de
  end
end
