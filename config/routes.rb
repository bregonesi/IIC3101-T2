Rails.application.routes.draw do
	
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, skip: :passwords
  devise_scope :user do
  	get '/users', to: 'users#index'
  	delete '/users/:id', to: 'users#destroy', as: :delete_user
  end

  resources :news

	root 'news#index'
end
