module ApplicationHelper

  def formatize text
    return "" if text.nil?
    
    text = text.gsub(/<image (\S+)>/) {
      begin
        img = Image.find("#{$1}")
        image_tag(img.image.url, :alt => img.title, :width => img.image_width, :height => img.image_height)
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text.html_safe
  end

end
