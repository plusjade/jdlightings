class PagesController < ApplicationController
  
  
  def index
    
  end 
  
  
  def about
    @categories = Category.all
    
    @products = Product.all
    
  end

  def conditions
  end 

  def dealer_inquiry
  end

  def contact
  end
  
  def support
  end
  
  def faq
  end
  
  def site_map
  end  
  
  def privacy_and_terms
  end
  
  
end
