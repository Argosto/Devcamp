Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :magics do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
  
end

