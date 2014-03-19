IpHome::Application.routes.draw do

  match '/museum' => redirect("http://momi.invisibleplayground.com")

  match '/navigation/' => 'navigation#show'
	match '/map/update' => 'map#update'
	match '/map/get_position' => 'map#get_position'

  scope "admin" do
		get "/", :controller => :admin, :action => :index
    get "/logout", :controller => :admin, :action => :logout, :as => 'logout'
		resources :pages
		resources :images
		resources :projects
		resources :tags
		resources :events
		resources :media_items
  end

  scope ":locale", :locale => /en|de/, :as => :public do
  	match '/projects/gallery' => 'projects#gallery', :as => 'projects_gallery'
  	match '/projects/list' => 'projects#list', :as => 'projects_list'
  	match '/events/list' => 'events#list', :as => 'events_list'
  	match '/events/upcoming' => 'events#upcoming'
  	match '/media_items/list' => 'media_items#list', :as => 'media_items_list'
  	resources :projects, :only => [:show, :update]
		resources :tags, :only => [:show, :update]
		resources :events, :only => [:show, :update]
		resources :pages, :only => [:show, :update], :path => ''
	end
  
  root :to => 'navigation#index'
  
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
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
