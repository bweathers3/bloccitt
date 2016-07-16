Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end


  resources :users, only: [:new, :create]

  post 'users/new_user_confirmation' => 'users#new_user_confirmation'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
