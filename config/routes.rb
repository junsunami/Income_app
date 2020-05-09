Rails.application.routes.draw do
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

end
