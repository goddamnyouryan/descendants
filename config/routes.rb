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

  root 'directors#index'
end
