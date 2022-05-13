Rails.application.routes.draw do
  get '/', to: 'lists#redirect'
  resources :lists, only: %i[create index show] do
    resources :bookmarks, only: %i[create]
  end

  resources :bookmarks, only: [:destroy]
end
