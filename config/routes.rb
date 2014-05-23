Electropop::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :projects, only: [:index], controller: 'elect/projects'
  resources :projects, only: [:show], controller: 'elect/project'

  namespace :admin do
    resources :languages, only: [:destroy], controller: 'elect/languages'
    resources :frameworks, only: [:destroy], controller: 'elect/frameworks'
    resources :externals, only: [:destroy], controller: 'elect/externals'
    resources :expos, only: [:edit, :update], controller: 'elect/expos'
    resources :demos, only: [:destroy], controller: 'elect/demos'
    resources :everythings, only: [:index], controller: 'elect/everythings'
    resources :projects, only: [:show], controller: 'elect/projects' do
      resources :languages, only: [:create], controller: 'elect/projects/languages'
      resources :frameworks, only: [:create], controller: 'elect/projects/frameworks'
      resources :externals, only: [:create], controller: 'elect/projects/externals'
    end
    resources :expos, only: [:new, :create], controller: 'elect/expos'
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
