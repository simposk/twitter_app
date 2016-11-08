Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:show, :edit]
  authenticated :user do
    root 'timeline#index'
  end

  root "static_pages#index"
end
