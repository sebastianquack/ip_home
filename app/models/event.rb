class Event < ActiveRecord::Base
	translates :description, :location, :title
  attr_accessible :date, :end_date, :description_de, :description_en, :location_de, :location_en, :time, :title_de, :title_en, :url
end
