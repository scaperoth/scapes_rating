Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  devise_for :users
  resources :users
  resources :ratable_items
  resources :ratable_item_categories

  authenticated :user do
    root to: 'visitors#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
