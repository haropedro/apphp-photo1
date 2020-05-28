Rails.application.routes.draw do
  resources :images do
    resources :comments
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  root 'welcome#index'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  resources :friendships, only: [:create, :destroy]

end
