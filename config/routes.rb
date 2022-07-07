Rails.application.routes.draw do
  devise_for :user, controllers: {
    registrations: 'user/registrations'
  }
  resources :books, :users, :top
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
