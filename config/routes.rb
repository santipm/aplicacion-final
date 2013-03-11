CursoRails::Application.routes.draw do
  get "perfil/index"

  get "perfil/show"

  get "perfil/update"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :perfil, :only =>[:index,:show,:update]

  match "nombre/:nombre" =>"users#show"
  match "contacto/:id" =>"users#contacto"

end