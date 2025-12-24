Rails.application.routes.draw do
  root "dashboard#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :sewas
  resources :penyewas
  resources :kasurs

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "up" => "rails/health#show", as: :rails_health_check
end
