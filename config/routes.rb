Rails.application.routes.draw do
  resources :people do
    member do
      post :return_all_books
      patch :borrow_book
    end
  end
  
  resources :books do
    member do
      patch :borrow
      patch :return_book
    end
  end

  # Defines the root path ("/")
  root "people#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
