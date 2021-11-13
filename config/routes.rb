Rails.application.routes.draw do
  resources :bachelorettes, only: [:show] do 
    resources :contestants, only: [:index, :show]
  end 
end
