Rails.application.routes.draw do
  resources :voters
  resources :politicians
  resources :territories
  resources :interviews do
    resources :votes
  end
  root 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
