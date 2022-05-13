Rails.application.routes.draw do
  root to: 'lists#first_log'
  resources :lists, only: %i[create index show destroy] do
    resources :bookmarks, only: %i[update edit create]
  end

  resources :bookmarks, only: %i[update destroy]
end
