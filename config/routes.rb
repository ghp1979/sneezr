Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  get "/report", to:"homes#index"
  get "/chart", to:"homes#index"
  get "/table", to:"homes#index"

  namespace :api do
    namespace :v1 do
      resources :symptom_reports, :allergen_reports
    end
  end
end
