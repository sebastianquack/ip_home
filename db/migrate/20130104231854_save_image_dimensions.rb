class SaveImageDimensions < ActiveRecord::Migration
  def up
		add_column :images, :image_width, :integer
		add_column :images, :image_height, :integer
  end

  def down
		remove_column :images, :image_width
		remove_column :images, :image_height
  end
end
