Rails.application.routes.draw do
  jsonapi_resources :pages
  jsonapi_resources :h1s
  jsonapi_resources :h2s
  jsonapi_resources :h3s
  jsonapi_resources :urls

  root to: "pages#index"
end
