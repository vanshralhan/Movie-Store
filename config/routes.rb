Rails.application.routes.draw do

  match '/admin/movies' => 'movies#create', via: :post

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :movies,:except => [:new, :delete,:edit,:update] do
      resources :comments
      collection do
        get 'browse', to: 'movies#browse'
      end
    end

  root 'movies#index'
end
