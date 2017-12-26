Rails.application.routes.draw do

  match '/admin/movies' => 'movies#create', via: :post

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
    resources :movies,:except => [:new, :delete,:edit,:update] do
      resources :comments
      collection do
        get 'browse', to: 'movies#browse'
      end
    end

  root 'movies#index'
end
