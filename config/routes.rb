Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages, only: [:new, :create]
  resources :home, only: [:index] do
    collection do
      post :import
      get :my_files
      get :clear_notifications
    end
  end
  root to: "home#index"
  mount ActionCable.server => '/websocketier'
end
