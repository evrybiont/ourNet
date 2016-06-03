Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',
                                   confirmations: 'confirmations',
                                   registrations: 'registrations'}

  #devise_scope :user do
    #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

  root 'dashboards#index'

  resources :profiles, only: [:show, :update, :edit] do
    put 'main', on: :member
    put 'change_avatar', on: :member
  end

  resources :musics, only: [:index, :create, :show] do
    get 'dashboard', on: :collection
    get 'list', on: :collection
    get 'albums', on: :collection
  end

  resources :dashboards, only: [:index, :show]

  resources :users, only: [:index, :show] do
    put 'toggle_follow', on: :member
    get 'following', on: :member
    get 'followers', on: :member
    get 'stars', on: :member
  end

  resources :videos, only: :index
  resources :photos, only: :index
  resources :about_us, only: :index

  resources :chops do
    put 'like', on: :member
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
