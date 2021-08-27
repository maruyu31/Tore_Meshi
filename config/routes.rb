Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions:      'public/users/sessions',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end
  devise_for :admins, module: "admin/admins", path: "/admin"
  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admin/admins/sessions#guest_sign_in'
  end
  root :to => "public/homes#top"
  get "about" => "public/homes#about"

  resources :users, only: [:show, :edit, :update], controller: "public/users" do
    resource :relationships, only: [:create, :destroy], controller: "public/relationships"
    get 'followings' => 'public/relationships#followings'
    get 'followers' => 'public/relationships#followers'
  end
  get "users/:id/cancel" => "public/users#cancel",  as: 'cancel'
  resources :recipes, controller: "public/recipes" do
    resource :favorites, only: [:create, :destroy], controller: "public/favorites"
    resources :comments, only: [:create, :destroy], controller: "public/comments"
  end
  resources :contacts, only: [:create], controller: "public/contacts"

  namespace :admin do
    get "/" => "contacts#index"
    resources :users, only: [:index, :show, :update]
    resources :recipes, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :edit, :create, :update]
    resources :contacts, only: [:index, :show, :update]
  end
end
