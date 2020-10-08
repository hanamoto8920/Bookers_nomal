Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  # ブックモデルのルーティング
  # ブックコントローラ
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # # ホームのコントローラ
  root "homes#top"
  get "home/about" => "homes#index"
  

  # ユーザーモデルのルーティング
  # ユーザーコントローラ
  resources :users, only: [:show, :edit, :update, :index]

end

