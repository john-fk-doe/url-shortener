Rails.application.routes.draw do
  root to: 'links#index'

  resources :links, only: [:index, :create]
  get '/links/:url', to: 'links#show', as: 'link'
  resources :visits, only: [:index]
  get '/statistics', to: 'visits#stats'

  get '/:url', to: 'links#visit', as: 'redirect'
end
