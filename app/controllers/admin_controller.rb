class AdminController < ApplicationController

  def index
    @categories = Category.all
    
    @products = Product.all
  
  end

end
