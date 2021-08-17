Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions:      'public/users/sessions',
  }
  devise_for :admins, module: "admin/admins", path: "/admin"
  root :to => "public/homes#top"
  get "about" => "public/homes#about"

  resources :users, only: [:show, :edit, :update], controller: "public/users"
  get "users/:id/cancel" => "public/users#cancel",  as: 'cancel'
  resources :recipes, controller: "public/recipes"

  namespace :admin do
    get "/" => "contacts#index"
    resources :contacts, only: [:index, :show]
  end
end
