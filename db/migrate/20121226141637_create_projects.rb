class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title_en
      t.string :title_de
      t.string :slug
      t.text :description_short_en
      t.text :description_short_de
      t.text :description_long_en
      t.text :description_long_de
      t.string :location
      t.string :time
      t.string :client
      t.string :website
      t.integer :in_gallery

      t.timestamps
    end
  end
end
