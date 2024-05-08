Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  root "films#index"

  resources :films
  resources :books

  namespace :api do
    namespace :v1 do
      post 'public_films', to: 'public_films#update'
      post 'public_books', to: 'public_books#update'
    end
  end
end
