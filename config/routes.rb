Rails.application.routes.draw do
  resources :cities
  resources :regions
  resources :people

  root 'pages#home'
end