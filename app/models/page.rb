class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_en, use: :slugged
  translates :title, :content

  attr_accessible :content_de, :content_en, :title_de, :title_en, :in_menu, :slug, :subpage, :hide_title, :welcome_page
end
