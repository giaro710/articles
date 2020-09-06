Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/personal_information", to: 'pages#personal_information'

  resources :posts

  get "/my_board", to: 'posts#my_board'
end
