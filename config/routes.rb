Rails.application.routes.draw do
  get 'static_pages/index'

  devise_for :users

  authenticated :user do
    root 'timeline#index'
  end

  root "static_pages#index"
end
