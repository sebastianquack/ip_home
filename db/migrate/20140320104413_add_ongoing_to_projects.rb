class AddOngoingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ongoing, :boolean, :default => false
  end
end
