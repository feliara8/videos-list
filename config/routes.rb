Rails.application.routes.draw do
  root to: 'landing#index'

  get 'videos', action: :index, controller: 'videos'
  post 'signin', action: :signin, controller: 'authentication'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/*path', to: 'landing#index'
end
