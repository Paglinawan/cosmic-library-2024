Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, skip: :registrations
  root "films#index"

  resources :films do
    member do
      get 'card_en'
      get 'card_jp'
    end
  end

  resources :books do
    member do
      get 'card_en'
      get 'card_jp'
    end
  end

  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable_entity'
  get '/500', to: 'errors#internal_server_error'

  match '*path', to: 'errors#not_found', via: :all
end
