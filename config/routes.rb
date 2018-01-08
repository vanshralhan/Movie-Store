Rails.application.routes.draw do

  match '/admin/movies' => 'movies#create', via: :post

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: "registrations" }
  # devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks", confirmations: "confirmations" }
  # as :user do
  #    get 'login' => 'sessions#new', :as => "login"
  #    get 'signup' => 'registrations#new', :as => "signup"
  #    get 'signout' => 'devise/sessions#destroy', :as => "signout"
  # end
    resources :movies,:except => [:new, :delete,:edit,:update] do
      resources :comments
      collection do
        get 'browse', to: 'movies#browse'
      end
    end

  root 'movies#index'
end
