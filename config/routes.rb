Rails.application.routes.draw do
  get 'subcategory/new'

  get 'report/new'

  post 'expense/new'
  get 'expense/list_all' => 'expense#list_all'
  root 'home#index'
  get  'login/new'
  get 'home/index' => 'home#index'
  post 'home/create_amount' => 'home#create_amount'
  get 'report/view' => 'report#view'
  post 'report/view' => 'report#apply'
  post 'login/create' => 'login#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"  

  # Example of regular route:
  post 'home/create_amount' => 'home#create_amount', :as=>:amounts
  post 'home/subcategory/create'=>'home#create_sub_category', :as=>:sub_categories
  resources :expense


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
