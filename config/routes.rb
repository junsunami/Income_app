Rails.application.routes.draw do
  resources :posts do
    collection do
      post :start_time
      get :stop
      post :end_time
      get :result

    end
  end

  devise_for :users
  root to: 'static#homepage'
  get 'features', to: 'static#features'

end
