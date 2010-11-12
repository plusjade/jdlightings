class PagesController < ApplicationController
  
  layout proc { |c| c.request.xhr? ? false : "application" }
      
  def index
    
  end 
  
  
  def about
    @parent_nav = "company"
  end

  def conditions
    @parent_nav = "company"
  end 

  def dealer_inquiry
    @parent_nav = "company"
  end

  def contact
    @parent_nav = "contact"
  end
  
  def support
    @parent_nav = "media"
  end
  
  def faq
  end
  
  def site_map
  end  
  
  def privacy_and_terms
  end
  
  def news
    @parent_nav = "media"
  end 
    
end
