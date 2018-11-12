Rails.application.routes.draw do
	root 'home#index'

  	resources :users, only: [:new, :create]
  	resources :questions
  	resources :sessions, only: [:new, :create, :destroy]
  	get 'admin', to: 'home#admin', as: 'admin'
  	post 'process_question', to: 'home#process_question', as: 'process_question'
  	get 'result', to: 'home#result', as: 'result'
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
end
