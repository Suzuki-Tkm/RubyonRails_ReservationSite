Rails.application.routes.draw do
  root "products#index"

  resources :products do
    patch :like, :unlike, :unlike1 , on: :member
    get :voted, on: :collection

    patch :in, :out , on: :member
    patch :increase, :decrease , on: :member
    get :cart, on: :collection
    post :confirm, on: :collection
    post :order , on: :collection
  end
  resources :categories, only: [:index, :show , :create]
  resources :brands
  resources :orders do
    post :order , on: :collection
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update , :new , :create] do
    get :history , on: :collection
  end
  resource :password, only: [:show, :edit, :update]
end
