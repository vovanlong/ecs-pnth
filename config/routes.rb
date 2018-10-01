Rails.application.routes.draw do
  root to: "home_pages#index"
  get '/category/:id', to: 'home_pages#show'
  get '/product/:id', to: 'home_pages#detail'
  get '/carts/:id', to: 'carts#index'
  get '/order/info', to: 'carts#information'
  # get '/carts/info', to: 'carts#info'

  namespace :authentication do
    get 'sessions/new'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signup", to: "authentication/auths#new"
  get  '/login',   to: 'authentication/sessions#new'
  post   '/login',   to: 'authentication/sessions#create'
  get '/logout',  to: 'authentication/sessions#destroy'
  namespace :admin do
    get "/", to: "dashbroads#index"
    resources :users
    resources :categories
    resources :orders
    resources :products do
      resources :photos, only: [:create]
    end
  end

  namespace :authentication do
    resources :auths, only: [:create]
    # resources :user
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :categories

      # resources :products
      resources :carts
      get 'home/products/new', to: 'products#product_new'
      get '/category/:id', to: 'categories#selected'
      get '/home/categories', to: 'categories#category_home'
      get '/home/categories/:id', to: 'categories#categoryById'
      get '/home/products/popular', to: 'products#popular'
      get '/home/products/detail/:id', to: 'products#detail'
      get '/home/related/:id', to: 'products#related'
      get '/carts/:id/remove', to: 'carts#remove_product'
      get '/carts/:id/add/:add', to: 'carts#add_quantity'
      get '/carts/:id/remove/:rem', to: 'carts#remove_quantity'
      post '/order', to: 'orders#order'
      get '/order/info', to: 'orders#info_order'
      get '/orders', to: 'orders#index'
      get '/product/:id/user/:user', to: 'orders#show'
    end
  end
end
