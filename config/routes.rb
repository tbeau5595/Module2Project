Rails.application.routes.draw do
  resources :user_rewards
  resources :rewards
  resources :charities
  resources :donations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
