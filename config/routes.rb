Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  
  devise_for :users, path: :account, only: [:sign_in, :sign_out, :session]
  
  resources :lists, only: :index
  resources :lists, path: :list, only: :show
  resources :list_items, path: :list_item, except: [:index] do
    resources :attribute_items, path: :attribute_item, shallow: true, only: %w(new create edit update)
  end

end
