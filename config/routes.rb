Rails.application.routes.draw do
  resources :secrets, only: [:new, :create]
  resources :mergers, only: [:new, :create]
  root "secrets#new"
end
