Rails.application.routes.draw do

  resources :directors, only: [:index, :show]

  namespace :admin do
    resources :directors, except: [:index, :show] do
      resources :videos, except: [:index, :show] do
        resources :media, only: [:create, :destroy]
      end
    end

    root to: 'base#index'
  end

  namespace :api do
    resources :videos, only: :show
  end

  post 'contact', to: 'contact_form#create'

  root 'directors#index'
end
