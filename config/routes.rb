Rails.application.routes.draw do

  get 'users/show'

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  get 'welcome/about'

  root 'welcome#index'

  post :incoming, to: 'incoming#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
