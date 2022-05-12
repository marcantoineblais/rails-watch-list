Rails.application.routes.draw do
  get '/', to: 'lists#redirect'
  resources :lists, only: %i[new create index show] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
