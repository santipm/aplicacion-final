CursoRails::Application.routes.draw do
  get "amistad/crear"

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
  match "amistad/crear/:id" =>"amistad#crear"
  match "amistades/aceptar/:nombre" =>"amistad#aceptar"
  match "amistades/rechazar/:nombre" =>"amistad#rechazar"
end