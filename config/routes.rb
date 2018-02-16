Rails.application.routes.draw do
  

  get 'map/index'

  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller_name#action_name'
  root 'application#hello'
  
  namespace :admin do
    resources :event_categories
    resources :events
  end
end
