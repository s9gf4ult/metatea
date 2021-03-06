Metatea::Application.routes.draw do

  root :to => "teas#index"

  devise_for :users

  get '/about', :to => 'pages#about'

  resources :tea_comparsions, :only => [:create, :destroy] do
    collection do
      scope "compare" do
        get "/:first_tea_id", :to => :select_second
        get "/:first_tea_id/:second_tea_id", :to => :comparsion
      end
    end
  end

  resources :tea_list_assignments, :only => [:create, :destroy] do
    collection do
      SETTINGS[:user][:lists].each do |lname|
        get lname
      end
    end
  end

  resources :tea_links, :only => [:create, :destroy, :new]

  resources :tea_pictures, :only => [:create, :destroy, :new, :show]

  resources :teas do
    member do
      post :comment
    end
  end

  namespace :axis do
    SETTINGS[:axis][:names].each do |axis_name|
      get axis_name, :to => axis_name
      get "#{axis_name}_tried".to_sym, :to => "#{axis_name}_tried".to_sym
    end
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
