Trazcupom::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount API => '/'


  get "now/index"

  get "pdfticket/print"

  get "getcupom/download"

  get "coming/soon"

  get 'user/print'

  get 'user/update_password'

  get 'now/index'

  resources :offers do
    post :like
  end

  get "user/profile"

  get "partner/login"

  get "establishments/likeestab"

  get "landing/anuncie"

  get 'landing/ticket'

  get  'user/download'

  get 'user/tickets'

  resources :user

  resources :establishments do
    post :like
  end

  devise_for :partners

  get "home/nearme"

  get "landing/page"

  match 'user/:id/edit' => 'user#edit', :as => :update_profile, via: [:patch]

  match 'partner/partner_auth' => 'partner#partner_auth', :as => :login_partner, via: [:post]

  match 'partner/dashboard' => 'partner#dashboard', :as => :dashboard, via: [:get]

  match 'partner/destroy_user' => 'partner#destroy_user', :as => :partner_logout, via: [:post]

  get 'partner/destroy_user'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #devise_for :users, :skip => [:sessions]



  #devise_for :users
  # You can have the root of your site routed with "root"
  root 'now#index'


  get 'landing/anuncie'
end
