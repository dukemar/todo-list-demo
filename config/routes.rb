Rails.application.routes.draw do
  get 'sessions/new'

  resources :users do
  resources :tasks
  end
  resources :account_activations, only: [:edit]
  resources :categories
  resources :tasks, only: [:index, :show]
  
  
  root 'welcome#index'
  get 'about_us'         => 'welcome#about_us'
  get 'signup'            => 'users#new'
  get 'category_list'     => 'categories#index'
  get 'category_show'     => 'categories#show' 
  get 'category_edit'     => 'categories#edit'
  get 'category_new'      => 'categories#new'
  get 'task_list'         => 'tasks#index'
  get 'task_show'         => 'tasks#show'
  get 'task_edit'         => 'tasks#edit'
  get 'task_new'          => 'tasks#new'
  get 'login'             => 'sessions#new'
  post 'login'            => 'sessions#create'
  delete 'logout'         => 'sessions#destroy' 
  
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
