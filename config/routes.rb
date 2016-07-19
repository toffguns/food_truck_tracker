Rails.application.routes.draw do

  get '/funfactor50' => 'contact_us#show'

  root "landing_page#index"

  devise_for :contributors, :controllers => { :omniauth_callbacks => "contributors/omniauth_callbacks" }
  devise_for :owners

  resources :owners
  resources :trucks do
    resources :reviews, except: [:show, :index]
  end
  resources :time_and_places

  get 'landing_page/map_location'
  get 'landing_page/search'
  get 'landing_page/get_markers_by_address'

  devise_scope :owner do
  get '/login' => 'devise/sessions#new'
  end

  get "*path" => redirect("/")



  # unauthenticated :owner do
  #   root 'landing_page#index', as: :unauthenticated_root
  # end

  # unauthenticated :owner do
  #   scope "/" do
  #     root 'landing_page#index', as: :unauthenticated_root
  #   end
  # end
  # unauthenticated do
  #   devise_scope :owner do
  #     root to: "landing_page#index", :as => "unauthenticated"
  #   end
  # end
  #
  #
  # authenticate :owner do
  #   scope "/owners" do
  #     resources :owners, only: [:new, :create, :edit, :update, :destroy]
  #   end
  # end

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
