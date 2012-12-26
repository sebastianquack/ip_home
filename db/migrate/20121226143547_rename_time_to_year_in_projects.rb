class RenameTimeToYearInProjects < ActiveRecord::Migration
  def up
      rename_column :projects, :time, :year
  end

  def down
        rename_column :projects, :year, :time
  end
end
