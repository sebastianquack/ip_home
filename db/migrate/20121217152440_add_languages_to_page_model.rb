class AddLanguagesToPageModel < ActiveRecord::Migration
	def self.up
    rename_column :pages, :title, :title_en
    rename_column :pages, :content, :content_en
		add_column :pages, :title_de, :string
		add_column :pages, :content_de, :text
  end

	def self.down
    rename_column :pages, :title_en, :title
    rename_column :pages, :content_en, :content
    remove_column :pages, :title_de
    remove_column :pages, :content_de
	end
end
