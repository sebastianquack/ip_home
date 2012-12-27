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
		
		if params[:controller] == 'pages' && params[:action] == 'show'
			return true
		else 
			return false
		end
	
	end


end
