Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :posts
  # resources :keywods
  get 'keywords' => 'keywords#index'
  post 'keywords' => 'keywords#create'
  delete 'keywords' => 'keywords#destroy'

  post 'posts' => 'posts#create'

end
