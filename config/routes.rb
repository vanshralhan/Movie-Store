Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :movies do
      collection do
        get 'browse', to: 'movies#browse'
      end
    end
    root 'home#index'
end
