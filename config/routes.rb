Jdlightings::Application.routes.draw do

  root :to => redirect("/auto")
  
  # two website sections with route_helpers
  constraints(:site => /(auto)|(hydro)/) do
    scope ":site", :controller => "pages", :name_prefix => "page" do
      match "()", :action => "index", :as => "home"
      get 'about'
      get 'conditions'        
      get 'dealer_inquiry'    
      get 'contact'           
      get 'support'           
      get 'news'               
      get 'faq'               
      get 'site_map'          
      get 'privacy_and_terms'
    end
  end  

  # routes for product engine
  resources :categories
  resources :products do
    resources :groups
  end
  resources :groups do
    member do
      get 'spec/:spec_id', :action => "spec"
    end    
    resources :items
  end
    
  # admin
  match 'admin' => "admin#index"
      
  #match ':site' => 'pages#about', :constraints => { :site => /[A-Z]\d{5}/ }
  
  #get "pages/about"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
