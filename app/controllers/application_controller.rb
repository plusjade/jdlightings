class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def get_site
    puts 'JADE'
    site = request.fullpath.split('/')[1]
    
    if site == 'auto' || site == 'hydro'
      @site = site
    else  
      # throw 404 error 
      puts "we need a site to scope to"
    end
    
  end
  
end
