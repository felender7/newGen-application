Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :request_forms
  root 'welcome#index'

  devise_for :users
  resources :contacts do
    collection { post :import }
  end

  resources :compose_messages
  get '/home', to:'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
