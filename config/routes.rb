Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'home#index'

  resources :events, only: [:index, :new, :create]

  get '/home', to: 'home#home', as: :home
end
