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
    
    text = text.gsub(/<a page:(\S+)>(\S+)<\/a>/) {
      begin
        page = Page.find("#{$1}")
        link_to "#{$2}", public_page_url(page) 
      rescue
        "<strong>Page with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<a project:(\S+)>(\S+)<\/a>/) {
      begin
        project = Project.find("#{$1}")
        link_to "#{$2}", public_project_url(project) 
      rescue
        "<strong>Project with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<a event:(\S+)>(\S+)<\/a>/) {
      begin
        event = Event.find("#{$1}")
        link_to "#{$2}", public_event_url(event) 
      rescue
        "<strong>Event with id #{$1} not found.</strong>"
      end      
    }



    text.html_safe
  end

end
