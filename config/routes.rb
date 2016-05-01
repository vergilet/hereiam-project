Rails.application.routes.draw do

  get 'home/map' => 'home#map'

  get 'spots' => 'spots#show'
  get '/spots/:id', to: 'spots#show', as: 'spot'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
