module ApplicationHelper

  def formatize text
    return "" if text.nil?
    
    text = text.gsub(/<image (\d+)>/) {
      begin
        img = Image.find("#{$1}")
        image_tag(img.image.url, :alt => img.title, :width => img.image_width, :height => img.image_height)
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<image (\d+):(.*?)>/) {
      begin
        img = Image.find("#{$1}")
        image_tag(img.image.url("#{$2}"), :alt => img.title)
      rescue
        "<strong>Image with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<a file:(.*?)>(.*?)<\/a>/) {
      link_to "#{$2}", Rails.configuration.static_storage + "#{$1}", :target => "_blank" 
    }
      
    text = text.gsub(/<a page:(.*?)>(.*?)<\/a>/) {
      begin
        page = Page.find("#{$1}")
        link_to "#{$2}", public_page_url(page), :class => "nav_ajax" 
      rescue
        "<strong>Page with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<a project:(.*?)>(.*?)<\/a>/) {
      begin
        project = Project.find("#{$1}")
        link_to "#{$2}", public_project_url(project), :class => "nav_ajax"  
      rescue
        "<strong>Project with id #{$1} not found.</strong>"
      end      
    }

    text = text.gsub(/<a event:(.*?)>(.*?)<\/a>/) {
      begin
        event = Event.find("#{$1}")
        link_to "#{$2}", public_event_url(event), :class => "nav_ajax"  
      rescue
        "<strong>Event with id #{$1} not found.</strong>"
      end      
    }



    text.html_safe
  end

end
