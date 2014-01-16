Trazcupom::Application.routes.draw do
  
  resources :catches

  resources :notes

  resources :rules

  resources :offers

  resources :products

  get "user/profile"
  resources :categories

  get "partner/login"
  get "landing/anuncie"

  get  'user/update_password'
  
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
  end

  resources :establishments



  devise_for :partners
  resources :plans

  resources :cities



  get "home/nearme"
  get "landing/page"

 

  match 'partner/partner_auth' => 'partner#partner_auth', :as => :login_partner, via: [:post]

  match 'partner/dashboard' => 'partner#dashboard', :as => :dashboard, via: [:get]
  match 'partner/destroy_user' => 'partner#destroy_user', :as => :partner_logout, via: [:post] 
  
  get 'partner/destroy_user'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #devise_for :users, :skip => [:sessions]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_for :users
  # You can have the root of your site routed with "root"
  root 'landing#page'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
