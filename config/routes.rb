Rails.application.routes.draw do
  get '/uploader', to:'fake#show'
  post '/uploader', to:'fake#create'

  get '/routes', to: 'routes#index'
  get '/routes/:id', to: 'routes#show'
  post 'routes', to: 'routes#create'
end
