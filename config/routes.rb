Rails.application.routes.draw do
  #get 'welcome/index'


  resources :articles do
    resources :comments
  end

  post 'articles/create'
  root 'articles#index'
  get 'articles/new'

  get '/admin', to: 'articles#admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
