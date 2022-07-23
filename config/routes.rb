Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i[index show]
  post 'follow/:id' => 'user_relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'user_relationships#unfollow', as: 'unfollow'
  get 'followings/:id', to: 'users#followings', as: 'followings'
  get 'followers/:id', to: 'users#followers', as: 'followers'
end
