Rails.application.routes.draw do
  get '/uploader', to:'fake#show'
  post '/uploader', to:'fake#create'
end
