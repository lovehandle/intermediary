Intermediary::Application.routes.draw do

  get "api/:id", to: "apis#call"

  resources :apis do
    member do
      get :call
    end
  end

  get "proxy", to: "proxy#page"
  get "proxy/content", to: "proxy#content"

  root "static_pages#home"

end
