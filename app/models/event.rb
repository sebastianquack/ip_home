class Event < ActiveRecord::Base
	translates :description, :location, :title
  belongs_to :project
  attr_accessible :date, :end_date, :description_de, :description_en, :location_de, :location_en, :time, :title_de, :title_en, :url, :project_id, :direct_to_project, :direct_to_url, :disable_link
end
