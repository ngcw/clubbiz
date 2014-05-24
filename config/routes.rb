Rails.application.routes.draw do

  post 'csadmin/announce' => 'csadmin#announce'

  get 'dashboard/csadmin' => 'csadmin#index'

  get 'about' => 'about#index'

  get 'home' => 'home#index'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :events, :clubs, :dashboard, :posts, :discussions
  resources :csadmin, path: '/dashboard/csadmin'
  resources :club_announcements

  authenticated :user do
    root :to => 'dashboard#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')

  #Club actions
  get     '/club/join/:id',  to:           'clubs#join',    as:    'join_club'
  get     '/club/leave/:id', to:           'clubs#leave',   as:   'leave_club'
  get     '/club/approve/:id', to:         'clubs#approve', as: 'approve_club'
  get     '/club/follow/:id', to:           'clubs#follow', as:  'follow_club'
  get     '/club/approveEvent/:id/:Eid', to:     'clubs#approveEvent', as: 'approve_event'
  #Event actions
  get     '/event/reserve/:id', to:         'events#reserve', as: 'reserve_event'
  get     '/event/share/:id'  , to:         'events#share',   as: 'share_event'  
  # Dashboard Actions
  get     '/dashboard/csadmin', to:         'dashboard#csadmin', as: 'csadmin_dashboard'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # root_url definition
  # root to: "home#index"

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
