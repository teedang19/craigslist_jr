RailsExample::Application.routes.draw do

  # CRUDify Categories!
  resources :categories do
    resources :posts
  end

  root 'categories#index'
end
