class AddEndDateToEvent < ActiveRecord::Migration
  def up
  	add_column :events, :end_date, :date
  end
  
  def down
  	remove_column :events, :end_date
  end
end
