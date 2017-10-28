Rails.application.routes.draw do
  get '/uploader', to:'fake#show'

  get '/routes', to: 'routes#index'
  get '/routes/:id', to: 'routes#show'
  post 'routes', to: 'routes#create'
  put '/routes/:id', to: 'routes#update'

  resources :uploads, only: [:create]
end
