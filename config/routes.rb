Rails.application.routes.draw do
  root to: "pages#home"
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  get "/profile", to: "pages#profile", as: :profile
  get "/mysessions", to: "pages#mysessions", as: :mysessions
  resources :playgrounds, only: :index do
    resources :sessions, only: %i[show new create] do
      resources :bookings, only: :create
    end
    resources :reviews, only: %i[new create]
  end
  resources :sessions, only: :destroy do
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end
  resources :bookings, only: :destroy
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
