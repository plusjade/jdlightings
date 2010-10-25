class PagesController < ApplicationController
  
  layout proc { |c| c.request.xhr? ? false : "application" }
  before_filter :setup
      
  def index
    
  end 
  
  
  def about
    @parent_nav = "company"

    #@categories = Category.all
    #@products = Product.all
    
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
  
  
  private
  
    def setup
      @parent_nav = 'nothing'
      @page = request.fullpath.split('/').pop
    end
  
end
