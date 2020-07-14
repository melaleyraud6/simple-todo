Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks , only: [:create, :edit, :update, :destroy] do
    member do
      get "complete"
      get "incomplete"
    end
  end
end
