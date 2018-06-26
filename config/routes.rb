Rails.application.routes.draw do

  resources :operations
  resources :politicians
  resources :territories
  root 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
