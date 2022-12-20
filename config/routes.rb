Rails.application.routes.draw do
  root "products#index"

  resources :products

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update , :new , :create] do
    get :history , on: :collection
  end
  resource :password, only: [:show, :edit, :update]
end
