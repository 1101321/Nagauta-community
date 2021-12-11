Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #トップページ・アバウトページ(homes)
  root :to => 'homes#top'
  get '/about' => 'homes#about'

  #楽曲(music)
  resources :musics, only: [:create, :index, :show, :edit, :update, :destroy]
  get '/musics' => 'musics#new', as: 'new_music'

  ##ユーザー(users)
  resources :users, only: [:show, :index, :edit, :update]

end