Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/about'
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "home#index"
   get  '/about', to: 'pages#about'
  # namespace for admin routes
  namespace :admin do
    # admin dashboard route
    get 'dashboard', to: 'dashboard#home' 
    resources :products
    resources :orders
    # resources :users
    # resources :product
  end
end




  
