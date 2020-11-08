Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/s/:slug', to: 'links#show', as: :short
  get '/urlaccess', to: 'links#urlaccess'
  root 'links#index'
  resources :links, only: :create
end
