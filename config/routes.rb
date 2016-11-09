Rails.application.routes.draw do
  devise_for :users

  resources :tweets, except: [:show, :edit] do
    member do
      put "like", to: "tweets#upvote"
      put "dislike", to: "tweets#downvote"
    end
  end

  authenticated :user do
    root 'timeline#index'
  end

  root "static_pages#index"
end
