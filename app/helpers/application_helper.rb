module ApplicationHelper

  def formatize text
    return "" if text.nil?
    
    text = text.gsub(/<image (\S+)>/) {
      begin
        img = Image.find("#{$1}")
        image_tag(img.image.url, :alt => img.title)
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text.html_safe
  end

	def public?
		
		if params[:action] == 'show' && (params[:controller] == 'pages' || params[:controller] == 'projects')
			return true
		else 
			return false
		end
	
	end


end
