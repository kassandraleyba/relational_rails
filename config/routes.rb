Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/welcome', to: 'welcome#index'

  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'

  # get '/works', to: 'works#index'
end
