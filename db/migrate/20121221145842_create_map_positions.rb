class CreateMapPositions < ActiveRecord::Migration
  def change
    create_table :map_positions do |t|
      t.float :lat
      t.float :lng
      t.string :ip

      t.timestamps
    end
  end
end
