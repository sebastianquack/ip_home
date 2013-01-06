class AddInMenuToPages < ActiveRecord::Migration
  def up
  	add_column :pages, :in_menu, :integer
  end
  
  def down
  	remove_column :pages, :in_menu
  end
end
