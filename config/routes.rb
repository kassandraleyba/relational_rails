Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artist', to: 'artist#index'
  get '/works', to: 'works#index'
end
