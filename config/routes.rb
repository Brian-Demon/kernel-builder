Rails.application.routes.draw do
  resources :kernel_builds
  resources :kernel_sources
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # ROOT
  root to: "home#index"

  #OAUTH
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", :as => :logout

end
