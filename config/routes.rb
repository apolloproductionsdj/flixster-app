Rails.application.routes.draw do
  devise_for :users
 root 'static_pages#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :courses, only: [:index, :show]
 namespace :instructor do 
  resources :sections, only: [] do
    resources :lessons, onlly: [:new, :create]
  end 
  resources :courses, only: [:new, :create, :show] do 
    resources :sections, only: [:new, :create] 
  end
 end
end