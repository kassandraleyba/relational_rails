Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'
  
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#update'
  delete '/artists/:id', to: 'artists#destroy'

  get '/works', to: 'works#index'
  get '/works/:id', to: 'works#show'
  get '/works/:id/edit', to: 'works#edit'
  patch '/works/:id', to: 'works#update'

  get '/artists/:id/works', to: 'artists/works#index'
  get '/artists/:id/works/new', to: 'artists/works#new'
  post '/artists/:id/works', to: 'artists/works#create'
end
