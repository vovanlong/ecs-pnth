Rails.application.routes.draw do
  namespace :authentication do
    get 'sessions/new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signup", to: "authentication/auths#new"
  get    '/login',   to: 'authentication/sessions#new'
  post   '/login',   to: 'authentication/sessions#create'
  delete '/logout',  to: 'authentication/sessions#destroy'
  namespace :admin do
    get "/", to: "dashbroads#index"
    resources :users, only: [:index, :edit ,:update, :destroy]
  end

  namespace :authentication do
    resources :auths, only: [:create]
    # resources :user
  end
end
