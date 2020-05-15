Rails.application.routes.draw do
  #projects
  get '/projects/:id', to: 'projects#show'

  #contestants
  get '/contestants', to: 'contestants#index'
  get '/contestants/new', to: 'contestants#new'
  post '/contestants', to: 'contestants#create'
end
