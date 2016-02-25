Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  #######################
  # User Reviews
  #######################

  get 'user_reviews/index'

  get 'user_reviews/show'

  get 'user_reviews/new'

  get 'user_reviews/create'

  get 'user_reviews/edit'

  get 'user_reviews/update'

  get 'user_reviews/destroy'

  #######################
  # Game Reviews
  #######################

  get 'game_reviews/index'

  get 'game_reviews/show'

  get 'game_reviews/new'

  get 'game_reviews/create'

  get 'game_reviews/edit'

  get 'game_reviews/update'

  get 'game_reviews/destroy'

  #######################
  # Game categories
  #######################

  get 'categories/' => 'categories#index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/:name' => 'categories#show'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  #######################
  # Games
  #######################

  get 'games/' => 'games#index'

  get 'games/new' => 'games#new'

  post 'games/create' => 'games#create'

  get 'games/:id' => 'games#show'

  get 'games/:id/edit' => 'games#edit'

  patch 'games/:id' => 'games#update'

  delete 'games/:id' => 'games#destroy'

  #######################
  # Sessions
  #######################
  root 'sessions#index'

  get '/register' => 'sessions#register'

  get '/' => 'sessions#index'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  #######################
  # Addresses
  #######################

  post 'addresses/create' => 'addresses#create'

  get 'addresses/new'

  get 'addresses/:id/edit' => 'addresses#edit'

  get 'addresses/show'

  patch 'addresses/:id' => 'addresses#update'

  delete 'addresses/destroy'

  #######################
  # Users
  #######################
  
  post 'users/addgame' => 'users#addgame'

  delete '/users/removegame' => 'users#removegame'

  get 'users/index'

  post 'users/create' => 'users#create'

  get 'users/new'

  get 'users/:id/edit' => 'users#edit'

  get 'users/:id' => 'users#show'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
