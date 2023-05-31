Rails.application.routes.draw do
  resources :patients
  resources :events
  resources :surveys
  resources :organizations
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "home#index"

  get '/surveysfixed', to: 'surveysfixed#index'
  get '/questionario', to: 'surveysfixed#new'

end
