class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.string :location_en
      t.string :location_de
      t.string :title_en
      t.string :title_de
      t.text :description_short_en
      t.text :description_short_de
      t.text :description_long_en
      t.text :description_long_de
      t.string :url

      t.timestamps
    end
  end
end
