class MediaItem < ActiveRecord::Base
  attr_accessible :date, :quote, :source, :url, :attachment, :project_id, :attachment_content_type, :attachment_file_name
	belongs_to :project
  has_attached_file :attachment, 
  	:storage => :s3, 
    :bucket         => ENV['S3_IP_HOME_BUCKET'],
    :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                         :secret_access_key => ENV['S3_SECRET'] },
  	:url => ':s3_domain_url',
    :path => "media/:id/item.:extension"

end
