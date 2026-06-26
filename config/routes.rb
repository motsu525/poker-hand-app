Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "top#index"

  authenticated :user do
    get "dashboard", to: "dashboard#index"
  end

  resources :tournaments, only: [:new, :create]

  resources :hands, only: [:index, :show] do
    resource :hero, only: [:new, :create], controller: "hands/heroes"
    resource :villain, only: [:new, :create], controller: "hands/villains"
    resource :preflop, only: [:new, :create], controller: "hands/preflops"
    resource :flop, only: [:new, :create], controller: "hands/flops"
    resource :turn, only: [:new, :create], controller: "hands/turns"
    resource :river, only: [:new, :create], controller: "hands/rivers"
  end

  get "terms", to: "pages#terms"
  get "privacy", to: "pages#privacy"
end