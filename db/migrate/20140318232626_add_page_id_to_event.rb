class AddPageIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :project_id, :integer
    add_column :events, :direct_to_project, :boolean, :default => false
  end
end
