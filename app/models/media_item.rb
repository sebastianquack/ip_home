class MediaItem < ActiveRecord::Base
  attr_accessible :date, :quote, :source, :url, :attachment, :project_id, :attachment_content_type, :attachment_file_name
	belongs_to :project
  has_attached_file :attachment, 
  	:storage => :s3, 
  	:s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
  	:url => ':s3_domain_url',
    :path => "media/:id/item.:extension"

end
