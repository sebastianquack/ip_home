class Image < ActiveRecord::Base
  attr_accessible :title, :image, :image_width, :image_height
  has_attached_file :image,
	  :styles => {:medium => "400x400>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :url => ':s3_domain_url',
    :path => "images/:id/:style/image.:extension"

	has_many :projects

  def filename_and_title
    if title.blank?       
      "#{image_file_name}"
    else
      "#{title} - #{image_file_name}"
    end
  end

	after_post_process :save_image_dimensions

  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(image.queued_for_write[:original])
    self.image_width = geo.width
    self.image_height = geo.height
  end

end
