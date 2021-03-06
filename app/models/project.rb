class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_en, use: :slugged
  translates :title, :description_short, :description_long 
  attr_accessible :client, :description_long_de, :description_long_en, :description_short_de, :description_short_en, :in_gallery, :location, :year, :start_date, :end_date, :title_de, :title_en, :website, :image_id, :direct_to_url, :main_media_embed, :ongoing
  belongs_to :image
  has_and_belongs_to_many :tags
  has_many :media_items

end
