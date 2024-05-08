Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  root "films#index"

  resources :films
  resources :books

  namespace :api do
    namespace :v1 do
      post 'public_cards', to: 'public_cards#update'
    end
  end
end
