ActionController::Routing::Routes.draw do |map|
  map.resources :users, :collection => { :list_batch => :get, :view_samples => :post }
  map.resources :samples, :collection => { :add_qcs => :post, :create_qc => :put, :show_qc_passed => :get, :add_library => :post, :create_library => :put,
                                           :show_lib_passed => :get, :add_lib_qc => :post, :create_lib_qc => :put, :show_lib_qc_passed => :get, :add_run => :post, :create_run => :put, :show_run_passed => :get  } 
  map.resources :qcs
  map.resources :batches
  map.resources :sequences
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.about '/about', :controller => 'pages', :action => 'about'
  map.help '/help', :controller => 'pages', :action => 'help'    
  map.signup '/signup',   :controller => 'users', :action => 'new'
  map.signin  '/signin',  :controller => 'sessions', :action => 'new'
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  map.submitnew '/submitNew', :controller => 'batches', :action => 'new'
  
  map.forgot_password    '/forgot_password', :controller => 'users', :action => 'forgot_password'  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => 'pages', :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
