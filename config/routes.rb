Rails.application.routes.draw do
  get 'universal/home'

  devise_for :users
  resources :patients do
    resources :notes
    resources :appointments
    resources :universal
  end
  root 'universal#home'
end
