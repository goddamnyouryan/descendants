Rails.application.routes.draw do

  resources :directors, only: [:index, :show]

  %w(lately the-joinery contact).each do |page|
    get page, controller: :pages, action: page.underscore
  end

  namespace :admin do
    resources :directors, except: [:index, :show] do
      resources :videos, except: [:index, :show] do
        resources :media, only: [:create, :destroy]
        collection { post :sort }
      end
      collection { post :sort }
    end
    resource :content, only: [:edit, :update]

    root to: 'base#index'
  end

  namespace :api do
    resources :videos, only: :show
    resources :directors, only: :show
  end

  root 'directors#index'
end
