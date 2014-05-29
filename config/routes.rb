Rails.application.routes.draw do
  resources :directors, only: [:index, :show]

  namespace :admin do
    resources :directors, only: [:new, :create, :edit, :update, :destroy]

    root to: 'base#index'
  end

  root 'directors#index'
end
