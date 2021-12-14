Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #トップページ・アバウトページ(homes)
  root :to => 'homes#top'
  get '/about' => 'homes#about'

  #楽曲(music)
  resources :musics, only: [:create, :index, :show, :edit, :update, :destroy, :new] do
    resource :favorites, only: [:create, :destroy]
    resources :music_comments, only: [:create, :destroy]
  end

  ##ユーザー(users)
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end

end