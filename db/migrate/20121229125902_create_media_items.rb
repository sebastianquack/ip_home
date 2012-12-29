class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :source
      t.date :date
      t.text :quote
      t.string :url

      t.timestamps
    end
  end
end
