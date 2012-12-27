class Image < ActiveRecord::Base
  attr_accessible :title, :image
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	has_many :projects

  def filename_and_title
    if title.blank?       
      "#{image_file_name}"
    else
      "#{title} - #{image_file_name}"
    end
  end

end
