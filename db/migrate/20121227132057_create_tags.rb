class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name_en
      t.string :name_de
      t.string :slug

      t.timestamps
    end
  end
end
