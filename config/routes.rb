Rails.application.routes.draw do
  resources :news do
  	resources :news_comments, path: 'comments'
  end

	root 'news#index'
end
