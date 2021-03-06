Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'home#index'

  resources :events, only: [:index, :new, :create, :show]

  resource :event_rosters, only: [:create, :destroy, :update]


  resources :users, only: [:index, :show, :update]

  resources :sms_notifications, only: [:new, :create]

  resources :profiles, only: [:update]

  get '/home', to: 'home#home', as: :home
end
