Picturesque::Application.routes.draw do

  root to: "photos#index"

  devise_for :users, controllers: { registrations: "registrations" }

  resources :users do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  resources :photos do
    resources :photo_comments, only: [:edit, :update, :destroy, :create], as: :comments

    member do
      post 'rate'
    end

    collection do
      post 'search'
    end

  end
end