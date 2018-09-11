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
    resources :users
    resources :categories
    resources :products do
      resources :photos, only: [:create]
    end
  end

  namespace :authentication do
    resources :auths, only: [:create]
    # resources :user
  end

  namespace :api do
    namespace :v1 do
      resources :categories
      get '/category/:id', to: 'categories#selected'
    end
  end
end
