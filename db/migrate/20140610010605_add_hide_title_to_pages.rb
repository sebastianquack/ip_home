class AddHideTitleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :hide_title, :boolean, :default => false
  end
end
