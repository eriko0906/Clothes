Rails.application.routes.draw do
  root 'pages#Home'
  get    '/about',  to: 'pages#about'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  resources :users
end
