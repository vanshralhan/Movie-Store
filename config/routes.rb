Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
    resources :movies do
      resources :comments
      collection do
        get 'browse', to: 'movies#browse'
      end
    end

  root 'home#index'
end
