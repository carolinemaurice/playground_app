Rails.application.routes.draw do
  root to: "pages#home"
  get "/profile", to: "pages#profile", as: :profile_path
  get "/mysessions", to: "pages#mysessions", as: :mysessions_path
  resources :playgrounds, only: :index do
    resources :sessions, only: %i[show new create] do
      resources :bookings, only: :create
    end
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
