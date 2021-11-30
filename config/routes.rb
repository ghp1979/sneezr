Rails.application.routes.draw do
  devise_for :users, :zip_code
  
  root "homes#index"

end
