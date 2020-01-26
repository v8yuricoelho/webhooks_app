Rails.application.routes.draw do
  resources :events, only: [:create]
  resources :issues, only: [:show] do
    resources :events, only: [:index]
  end
end
