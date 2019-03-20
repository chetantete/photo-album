Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
    resources :albums do
      resources :photos
    end
  end
  # root 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
