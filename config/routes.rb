Rails.application.routes.draw do
  resources :regions do
    resources :cities
  end

  resources :people

  root 'pages#home'
end