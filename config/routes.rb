Rails.application.routes.draw do
  get '/uploader', to:'fake#show'

  get '/routes', to: 'routes#index'
  get '/routes/:id', to: 'routes#show', constraints: { id: /\d+/ }
  post 'routes', to: 'routes#create'
  put '/routes/:id', to: 'routes#update'
  get '/routes/filter', to: 'routes#filter'
  get '/routes/export/:id', to: 'routes#export'

  resources :uploads, only: [:create]
end
