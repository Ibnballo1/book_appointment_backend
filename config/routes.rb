Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # namespace :api do
  #   resources :rooms
  # end
  # Defines the root path route ("/")
  get '/', to: redirect('/api-docs')
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy]
      resources :rooms, only: [:index, :show, :create, :destroy]
    end
  end
  resources :users
  post '/auth/login', to: 'authentication#login'
end
