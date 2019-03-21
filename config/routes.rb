Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'recipes#index'

  # devise_for :users, controllers: { sessions: 'users/sessions' }


  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end



  
  devise_for :users
end
