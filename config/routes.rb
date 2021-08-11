Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions:      'public/users/sessions',
  }
  devise_for :admins, module: "admin/admins", path: "/admin"
  root :to => "public/homes#top"
  get "about" => "public/homes#about"
  resources :users, only: [:show, :edit, :cancel], controller: "public/users"

  namespace :admin do
    get "/" => "contacts#index"
    resources :contacts, only: [:index, :show], controller: "admin/contacts"
  end
end
