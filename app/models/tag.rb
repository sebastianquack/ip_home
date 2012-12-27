class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name_en, use: :slugged
  translates :name
  attr_accessible :name_de, :name_en
  has_and_belongs_to_many :projects  
end
