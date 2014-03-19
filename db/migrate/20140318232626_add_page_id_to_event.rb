class AddPageIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :project_id, :integer
    add_column :events, :direct_to_project, :boolean, :default => false
    add_column :events, :direct_to_url, :boolean, :default => false
    add_column :events, :disable_link, :boolean, :default => false
    add_column :projects, :direct_to_url, :boolean, :default => false
  end
end
