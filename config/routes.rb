Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # ROOT
  root to: "home#index"

  # OAUTH
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", :as => :logout

  # RESOURCES
  resources :kernel_builds
  resources :kernel_configs
  resources :kernel_sources
  resources :users
end
