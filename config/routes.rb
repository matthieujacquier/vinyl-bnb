Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  get "listings/my_listings", to: "listings#my_listings", as: :my_listings
  get "bookings/my_booking_requests", to: "bookings#my_booking_requests", as: :my_booking_requests
  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update] do
    member do
      patch :accept
      patch :refuse
    end
  end

  get "about_me" => "users#show", as: "about_me"
  get "about_me/edit" => "users#edit", as: "edit_about_me"
  patch "about_me" => "users#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
