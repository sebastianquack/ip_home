class Image < ActiveRecord::Base
  attr_accessible :title, :image
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
