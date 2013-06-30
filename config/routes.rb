Monglar::Application.routes.draw do
  root 'home#index'
  resources :rooms
end
