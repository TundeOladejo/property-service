Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      # get 'properties/index'
      # get 'properties/show'
      # get 'properties/create'
      # get 'properties/update'
      # get 'properties/destroy'
      # get 'properties/index'
      # get 'properties/show'
      resources :properties, only:[:index, :show, :create, :update]
      get 'properties/owner/:owner', to: 'properties#owner'
      get 'properties/property_address/:property_address', to: 'properties#property_address'
    end
  end
  resources :properties
  get 'properties/owner/:owner', to: 'properties#owner'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
