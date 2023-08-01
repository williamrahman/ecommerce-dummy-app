Rails.application.routes.draw do
  namespace :logins do
    resources :customers do
      post :authenticate, on: :collection
    end

    resources :sellers do
      post :authenticate, on: :collection
      delete 'logout' => 'sellers#logout'
    end
  end

  namespace :customers do
    get "/", to: "dashboard#index", as: "root"
  end

  namespace :sellers do
    get "/", to: "dashboard#index", as: "root"
    resources :products
  end
end
