Rails.application.routes.draw do
  root to: "home_pages#index"

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
      resources :products
      get '/products/popular', to: 'products#popular'
      get '/category/:id', to: 'categories#selected'
      get '/home/categories', to: 'categories#category_home'
      get '/home/categories/:id', to: 'categories#categoryById'

    end
  end
end
