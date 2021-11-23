Rails.application.routes.draw do
  devise_for :users
  root "homes#index"
  get "/report", to:"homes#index"
end
