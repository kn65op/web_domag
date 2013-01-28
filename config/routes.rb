WebDomag::Application.routes.draw do



	#devise_for :users, :skip => [:sessions]
#	as :user do
#		match 'signin' => 'users#main_page', :as => :new_user_session
#		post 'signin' => 'devise/sessions#create', :as => :user_session
#		delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
#	end

	#root to
root :to => redirect("/en")
#	  root :to => redirect("/en/users/sec")

#	authenticated do #path where to go after login
#	  root :to => redirect("/en/users/sec")
#	end

	#localized routed
	localized do
	  root :to => 'users#main_page'
		match "/user/settings" => "users#settings", :as => "user_settings"
    devise_for :users
    match "shopping" => "users#shopping", :as => "shopping"
    match "consume/:id" => "users#consume_thing_instance", :as => "consume"
    match "move/:id" => "users#move_thing_instance", :as => "move"

    match "storages" => "storages#index", :as => "storages"
    match "storage/new" => "storages#new", :as => "new_storage"
    match "storage/edit/:id" => "storages#edit", :as => "edit_storage"
    match "storage/delete/:id" => "storages#delete", :as => "delete_storage"
    match "storage/confirmed_delete/:id" => "storages#confirmed_delete", :as => "confirmed_delete_storage"
    match "storage/:id" => "storages#view", :as => "view_storage"
    match "categories" => "categories#index", :as => "categories"
    match "category/new" => "categories#new", :as => "new_category"
    match "category/:id" => "categories#view", :as => "view_category"
    match "category/edit/:id" => "categories#edit", :as => "edit_category"
    match "category/delete/:id" => "categories#delete", :as => "delete_category"
    match "category/confirmed_delete/:id" => "categories#confirmed_delete", :as => "confirmed_delete_category"
    match "things" => "things#index", :as => "things"
    match "thing/new" => "things#new", :as => "new_thing"
    match "thing/:id" => "things#view", :as => "view_thing"
    match "thing/edit/:id" => "things#edit", :as => "edit_thing"
    match "thing/delete/:id" => "things#delete", :as => "delete_thing"
    match "thing/confirmed_delete/:id" => "things#confirmed_delete", :as => "confirmed_delete_thing"
    match "manufacturers" => "manufacturers#index", :as => "manufacturers"
    match "manufacturer/new" => "manufacturers#new", :as => "new_manufacturer"
    match "manufacturer/:id" => "manufacturers#view", :as => "view_manufacturer"
    match "manufacturer/edit/:id" => "manufacturers#edit", :as => "edit_manufacturer"
    match "manufacturer/delete/:id" => "manufacturers#delete", :as => "delete_manufacturer"
    match "manufacturer/confirmed_delete/:id" => "manufacturers#confirmed_delete", :as => "confirmed_delete_manufacturer"
    match "shops" => "shops#index", :as => "shops"
    match "shop/new" => "shops#new", :as => "new_shop"
    match "shop/:id" => "shops#view", :as => "view_shop"
    match "shop/edit/:id" => "shops#edit", :as => "edit_shop"
    match "shop/delete/:id" => "shops#delete", :as => "delete_shop"
    match "shop/confirmed_delete/:id" => "shops#confirmed_delete", :as => "confirmed_delete_shop"
	end
  match "thing/get_limits/:id/:do" => "things#get_limits"
  match "add_thing/:nr" => "users#add_thing"
  match "get_things/:id" => "users#get_things"
  match "get_unit/:id" => "users#get_unit"

	#translations
  WebDomag::Application.routes.translate_from_file

	#devise link to login
#	as :user do
#		match "/users/main_page" => "devise/sessions#new"
#	end
	
  # The priority is based upon order of creation:
  # first created => highest priority.

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
  #       match 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       match 'sold'
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
  #       match 'recent', :on => :collection
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
