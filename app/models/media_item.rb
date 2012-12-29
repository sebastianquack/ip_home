class MediaItem < ActiveRecord::Base
  attr_accessible :date, :quote, :source, :url, :attachment, :project_id, :attachment_content_type, :attachment_file_name
	belongs_to :project
  has_attached_file :attachment
end
