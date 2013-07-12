Intermediary::Application.routes.draw do
  resources :apis do
    member do
      get :query
    end
  end

  resources :mappings

  root "static_pages#home"
end
