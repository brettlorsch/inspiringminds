Rails.application.routes.draw do
  resources :tests
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'pages/home', to: 'pages#home'

  get 'pages/about', to: 'pages#about'

  get 'pages/resources', to: 'pages#resources'

  get 'pages/contact', to: 'pages#contact'

  get 'pages/admission', to: 'pages#admission'
  
  get 'pages/kelly', to: 'pages#kelly'

  get 'pages/dawn', to: 'pages#dawn'

  resources :testings

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
