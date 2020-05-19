Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :posts

      root to: "users#index"
    end
  resources :posts do
    member do
      post :start_time
      get :stop
      post :end_time
      get :result

    end
  end

  devise_for :users
  root to: 'static#homepage'
  get 'features', to: 'static#features'
  get 'login_home', to: 'static#login_home'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
