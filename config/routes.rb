Rails.application.routes.draw do
  devise_for :users
  root "films#index"

  resources :films
end
