Rails.application.routes.draw do
  namespace :movies do
    resources :shares, constraints: { id: /[0-9]+/ }
  end
  resources :home
  resources :movies, constraints: { id: /[0-9]+/ }
  root to: 'home#index'

  devise_for :users, controllers: { sessions: "users/sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
