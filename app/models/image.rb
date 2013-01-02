class Image < ActiveRecord::Base
  attr_accessible :title, :image
  has_attached_file :image,
	  :styles => { :medium => "300x300>", :thumb => "100x100>" },
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

end
