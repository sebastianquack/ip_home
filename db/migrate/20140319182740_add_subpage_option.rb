class AddSubpageOption < ActiveRecord::Migration
  def change
    add_column :pages, :subpage, :boolean, :default => false
  end
end
