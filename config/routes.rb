Rails.application.routes.draw do
  
  root to: 'recipes#index'

  resources :categories do 
    resources :recipes, only: [:index, :show, :new] 
  end

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :recipes 

  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end



  
  devise_for :users
end
