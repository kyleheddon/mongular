Monglar::Application.routes.draw do
  root 'home#index'
  resources :users
  resources :rooms do
    resources :messages
  end
end
