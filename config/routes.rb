Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  get "/report", to:"homes#index"
  get "/chart", to:"homes#index"
  get "/data", to:"homes#index"
  get "/data/table", to:"homes#index"
  get "/data/symptoms", to:"homes#index"

  namespace :api do
    namespace :v1 do
      resources :symptom_reports
      end
      resources :allergen_reports
    end
  end

