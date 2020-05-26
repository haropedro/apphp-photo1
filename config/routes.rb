Rails.application.routes.draw do
  resources :images
  devise_for :users, :controllers => { :registrations => 'registrations' }
  root 'welcome#index'
  get 'my_friends', to: 'users#my_friends'
  
end
