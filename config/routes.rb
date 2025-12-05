Rails.application.routes.draw do
  get 'pages/home'
  get 'staff_members/index'
  get 'bookings/index'
  root "pages#home"

  resources :bookings, only: [:index]
  resources :staff_members, only: [:index]
end
