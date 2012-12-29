class DropLongDescriptionForEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :description_short_de, :description_de
  	rename_column :events, :description_short_en, :description_en
  	remove_column :events, :description_long_de
  	remove_column :events, :description_long_en
  end

  def down
  end
end
