Rails.application.routes.draw do
  resources :answers
  resources :patients
  resources :events
  resources :surveys
  resources :organizations

  resources :events do
    post :import_patients, on: :collection
  end

  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "home#index"
  get '/users', to: 'users#index'
  get '/advice', to: 'answers#advice', as: 'advice'



end
