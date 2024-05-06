Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  root "films#index"

  resources :films
end
