Rails.application.routes.draw do
  root "products#index"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  
  resources :products do
    get "search" , on: :collection
    patch :like, :unlike, :unlike1 , on: :member
    get :voted, on: :collection

    patch :in, :out , on: :member
    patch :increase, :decrease , on: :member
    get :cart, on: :collection
    post :confirm, on: :collection
    post :order , on: :collection
  end
  resources :categories, only: [:index, :show , :create]
  resources :brands , except: [:edit, :update]
  resources :orders , only: [:destroy] do
    get :history , on: :collection
    get :brand_order , on: :collection
    post :brand_send , on: :member
  end
  resources :members , only: [:index , :destroy]
  
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update , :new , :create] do
    get :admin_show , on: :member
    get :admin_edit , on: :member
    patch :admin_update , on: :member
  end
  resource :password, only: [:show, :edit, :update] do
    get :admin_show , on: :member
    get :admin_edit , on: :member
    patch :admin_update , on: :member
  end
end
