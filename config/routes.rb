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
    get "/sessions/:id/notice_new_player", to: "sessions#notice_new_player"
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
  resources :notifications_users, only: :show do
    resources :notifications, only: :create
    post "/notifications/:id/mark_as_read", to: "notifications#mark_as_read"
    post "/notifications/:id/mark_as_unread", to: "notifications#mark_as_unread"
  end
end
