class AddProjectIdToMediaItem < ActiveRecord::Migration
  def up
  	  add_column :media_items, :project_id, :integer
  end

	def down
		remove_column :media_items, :project_id
	end

end
