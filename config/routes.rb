Intermediary::Application.routes.draw do

  get "api/:id", to: "apis#call"

  resources :apis do
    member do
      get :call
    end
  end

  root "static_pages#home"

end
