class AdminController < ApplicationController

  layout false
  def index
    @categories = Category.all
    
    @products = Product.all
  
  end

end
