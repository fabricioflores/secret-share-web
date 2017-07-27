Rails.application.routes.draw do
  resources :secrets, only: [:new, :create]
  root "secrets#new"
end
