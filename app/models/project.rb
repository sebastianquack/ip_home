class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_en, use: :slugged
  translates :title, :description_short, :description_long 
  attr_accessible :client, :description_long_de, :description_long_en, :description_short_de, :description_short_en, :in_gallery, :location, :year, :title_de, :title_en, :website, :image_id
  belongs_to :image
  has_and_belongs_to_many :tags
end
