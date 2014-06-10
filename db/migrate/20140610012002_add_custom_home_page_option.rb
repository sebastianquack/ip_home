class AddCustomHomePageOption < ActiveRecord::Migration

  def change
    add_column :pages, :welcome_page, :boolean, :default => false
  end
end
